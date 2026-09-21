FROM debian:13 AS builder
WORKDIR /build
RUN dpkg --add-architecture arm64 && apt update -y
RUN apt install -y git cmake g++-aarch64-linux-gnu gcc-aarch64-linux-gnu libsamplerate0-dev:arm64 zlib1g-dev:arm64 libsdl2-dev:arm64
RUN git clone https://github.com/alexbatalov/fallout2-ce .
ADD r36s_toolchain.cmake .
RUN cmake -S . -B . -DCMAKE_TOOLCHAIN_FILE=r36s_toolchain.cmake -DFALLOUT_VENDORED=OFF -DCMAKE_BUILD_TYPE=Release
RUN cmake --build . --config Release

FROM scratch
COPY --from=builder /build/fallout2-ce /
