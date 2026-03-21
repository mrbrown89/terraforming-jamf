#!/bin/zsh --no-rcs

url="<put your jamf url here>"

getAccessToken() {
    response=$(curl -s \
        --request POST "$url/api/v1/oauth/token" \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data-urlencode "client_id=$client_id" \
        --data-urlencode "grant_type=client_credentials" \
        --data-urlencode "client_secret=$client_secret")

    access_token=$(echo "$response" | plutil -extract access_token raw - 2>/dev/null)
}

echo "Enter API Client ID:"
read client_id

echo "Enter API Client Secret:"
read -s client_secret
echo ""

getAccessToken

if [[ -z "$access_token" ]]; then
    echo "Failed to get access token"
    exit 1
fi

page="0"
pageSize="100"
totalMatches="0"

echo "Searching for computers with 'virt' in the name..."
echo ""

while true; do
    responseFile=$(mktemp)

    httpCode=$(curl -s \
        --output "$responseFile" \
        --write-out "%{http_code}" \
        --get \
        -H "Authorization: Bearer $access_token" \
        -H "Accept: application/json" \
        --data-urlencode "page=$page" \
        --data-urlencode "page-size=$pageSize" \
        --data-urlencode "section=GENERAL" \
        --data-urlencode 'filter=general.name=="*virt*"' \
        "$url/api/v1/computers-inventory")

    depsJson=$(cat "$responseFile")

    if [[ "$httpCode" != "200" ]]; then
        echo "Jamf returned HTTP $httpCode"
        echo "$depsJson"
        rm -f "$responseFile"
        exit 1
    fi

    resultCount=$(echo "$depsJson" | jq '.results | length')

    if [[ "$resultCount" -eq 0 ]]; then
        rm -f "$responseFile"
        break
    fi

    while IFS=$'\t' read -r id name udid serial; do
        [[ -z "$id" ]] && continue

        (( totalMatches++ ))

        echo "ID: $id"
        echo "Name: $name"
        echo "UDID: $udid"
        echo "Serial: $serial"
        echo "------------------------------"

    done < <(
        echo "$depsJson" | jq -r '.results[] | [.id, .general.name, .udid, .hardware.serialNumber] | @tsv'
    )

    rm -f "$responseFile"
    (( page++ ))
done

echo ""
echo "Total matches found: $totalMatches"
