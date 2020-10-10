if [[ -f .rubydeps ]]; then
    rm -r ./.rubydeps
fi

if [[ -f _site ]]; then
    rm -r ./_site
fi

if [[ -f Gemfile.lock ]]; then
    rm ./Gemfile.lock
fi    

if [[ -f .bundle ]]; then
    rm -r ./.bundle 
fi
