echo "---- STARTING DEPLOY-LINKED (V1.0): $(date +"%F-%H-%M-%S")" >> $1

echo "  PWD: $PWD" >> $1
echo "  BASE_HREF: $BASE_HREF" >> $1
echo "  WEBSITE_FOLDER: $WEBSITE_FOLDER" >> $1

echo "  DEPLOY-LINKED: Installing" >> $1
npm i
echo "  DEPLOY-LINKED: Building" >> $1
npm run build -- --prod --aot --base-href "$BASE_HREF" >> $1

echo "  DEPLOY-LINKED: Linking" >> $1
old_dist=$(readlink -f "${WEBSITE_FOLDER}dist")
new_dist="dist-$(date +"%F-%H-%M-%S")"
mv www $new_dist
ln -sfn "$PWD/$new_dist" "${WEBSITE_FOLDER}dist"
rm -r $old_dist

echo "---- END ON-UPDATE: $(date +"%F-%H-%M-%S")" >> $1
