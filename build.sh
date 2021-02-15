USER_PLATFORM="$1"
if [ "$USER_PLATFORM" != linux ]
then
    echo "Error: platform must be linux !" 2>&1
    exit 1
fi

cd core || exit
bash build.sh

echo "Building neutralino.js"
cd ../neutralino.js || exit

test ! -d node_modules/ && npm install
npm run build
cp dist/neutralino.js ../core/bin/app/assets/neutralino.js

cd .. || exit
cp -r core/bin/* dist/
