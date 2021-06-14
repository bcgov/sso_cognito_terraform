#!/bin/bash

help="\
    Usages:
        $0 <team> <client> [--dev] [--test] [--prod]

    Environments:
        --dev   Create a client in Dev environment.
        --test  Create a client in Test environment.
        --prod  Create a client in Prod environment.

    Notes:
        - Multiple environment flags can be set.

    Examples:
        $ ./bin/add-client.sh team-blue test-client --dev
        $ ./bin/add-client.sh team-blue-basic test-client --dev --prod
        $ ./bin/add-client.sh team-blue-both test-client --dev --test --prod
    "

if [ "$#" -lt 2 ]; then
    echo -e "$help"
    exit 0
fi

team="$1"
client="$2"
export team client

if [ "$1" = "variables" ]; then
    echo "variables is a reserved name"
    exit 0
fi

pwd="$(dirname "$0")"
terraform="$pwd/../terraform"
example="$terraform/team.tf.example"
team_file="$terraform/teams/${team}.tf"

shift
shift

while [[ "$1" == -* ]]; do
    case $1 in
    -d | --dev)
        export env="dev"
        template=$(envsubst <"$example")
        echo "$template" >>"$team_file"
        echo "The client '${client}' generated in '$team_file' for '${env}' environment."
        ;;
    -t | --test)
        export env="test"
        template=$(envsubst <"$example")
        echo "$template" >>"$team_file"
        echo "The client '${client}' generated in '$team_file' for '${env}' environment."
        ;;
    -p | --prod)
        export env="prod"
        template=$(envsubst <"$example")
        echo "$template" >>"$team_file"
        echo "The client '${client}' generated in '$team_file' for '${env}' environment."
        ;;
    -h | --help)
        echo -e "$help"
        exit 0
        ;;
    esac
    shift
done

echo -e "\nplease update 'supported_identity_providers' and 'callback_urls' in the template."
