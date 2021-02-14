assertCurl() {
  statusCode=$1
  resultCode=$(eval $2 | cut -d'n' -f 1)

  if [ "$statusCode" = "$resultCode" ]
  then
    echo "Test OK (HTTP Code: $statusCode)"
  else
      echo  "Test FAILED, EXPECTED HTTP Code: $statusCode, GOT: $resultCode, WILL ABORT!"
      exit 1
  fi
}

assertCurl 200 "curl --write-out "%{http_code}\n" --silent --output /dev/null "www.google.com""
