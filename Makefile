git-pull:
	git pull
	git submodule update --init --recursive

build:
	rm -rf docs/
	hugo  --buildDrafts --destination public --baseURL=http://localhost:1313 && npm run build


preview:
	python3 -m http.server 1313 --directory public