#!/bin/bash
# (set -e) = Stop the program if he makes a mistake.
set -e

# shellcheck disable=SC2034
resultFile=$(pwd)/finalResult.md

while getopts ":m:f:s:h" flag; do
    # shellcheck disable=SC2220
    case "${flag}" in
        m) mod=${OPTARG};;
        f) resultFile=${OPTARG};;
        s) specificFile=${OPTARG};;
        h) help=true ;;
    esac
done

if [[ "$help" == true ]]; then
echo -e 'LaunchTest runs tests on backend and frontend projects. \nYou can set the options listed above.'
echo -e "\n\tAvailable options
          \n-m ----> Write -m show to run a frontend test with a browser open.
          \n-f ----> Write -f <YOUR_SPECIFIC_PATH> to save the test file to a specific path.
          \n-s ----> Write -s <PATH_TO_SPECIFIC_FILE> run a specific file of frontend tests (without the browser opened).
          \n-h ----> Write -h to show all options for running this script."
else
  #Launch tests on backend project
	cd ./conduit-backend-tests
  # /dev/null = black hole -- Change the output of the command to this path, the result is not visible to the user in the terminal.
  # tee = Allows you to specify another output in relation to the command.
  # & = After launching the servers, it allows you to put them in the background.
	php artisan test --without-tty --colors=never | tee $resultFile
	php artisan migrate:fresh --seed > /dev/null
	php artisan serve --host=127.0.0.1:8000&

  #Launch tests on frontend project
	cd ../vue3-realworld-example-app
  npm run build > /dev/null
  npm run serve&

	if [[ $mod == show ]]; then
		node_modules/.bin/cypress open --browser chrome --e2e -c baseUrl=http://localhost:4137 | tee -a $resultFile
	elif [[ $specificFile != "" ]]; then
	  node_modules/.bin/cypress run --e2e --spec $specificFile -c baseUrl=http://localhost:4137 | tee -a $resultFile
	else
		 node_modules/.bin/cypress run --e2e -c baseUrl=http://localhost:4137 | tee -a $resultFile
	fi
fi