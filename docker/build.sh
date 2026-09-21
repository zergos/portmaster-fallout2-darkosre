set -e

mkdir -p out
docker build --output=out .
chmod +x out/fallout2-ce
