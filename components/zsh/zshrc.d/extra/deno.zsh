#Deno is a JavaScript, TypeScript, and WebAssembly runtime.
export DENO_INSTALL="$HOME/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"
if ! type "deno" > /dev/null;then
  #https://deno.land/manual@v1.35.2/getting_started/installation
  curl -fsSL https://deno.land/x/install/install.sh | sh
fi
