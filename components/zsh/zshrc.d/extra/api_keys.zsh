export API_KEYS_DIR=$XDG_DATA_HOME/llm_api_keys
if test -d $API_KEYS_DIR; then
  for key in $(find $API_KEYS_DIR -name '*.key'); do
    api_key_env_name=$(basename -s .key ${key}|awk '{print toupper($0)}')_API_KEY
    export $api_key_env_name=$(cat $key);
  done
fi
