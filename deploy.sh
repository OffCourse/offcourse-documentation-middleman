bundle exec middleman build
cp .nojekyll build/.nojekyll
cp CNAME build/CNAME
cd build
git init
git remote add origin git@github.com:offcourse/offcourse-info.git
git add -A
git commit -m "deploy"
git checkout -B gh-pages
git push -u origin gh-pages -f