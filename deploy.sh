bundle exec middleman build
cp .nojekyll build/.nojekyll
echo info-staging.offcourse.io > build/CNAME
cd build
git config user.name "Zaturrby"
git config user.email "rjkorteschiel@gmail.com"
git init
git add -A
git commit -m "deploy"
git push -f --quiet "https://${GH_TOKEN}@github.com/offcourse/offcourse-info.git" master:gh-pages > /dev/null 2>&1
git push -u origin gh-pages -f