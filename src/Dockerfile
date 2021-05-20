FROM golang:1.16-alpine@sha256:4dd403b2e7a689adc5b7110ba9cd5da43d216cfcfccfbe2b35680effcf336c7e AS builder

WORKDIR /scratch
COPY . .
WORKDIR /scratch/src
RUN go build -o /scratch/app .

FROM alpine:3.13.5@sha256:69e70a79f2d41ab5d637de98c1e0b055206ba40a8145e7bddb55ccc04e13cf8f

WORKDIR /scratch
COPY --from=builder /scratch/app app

ENTRYPOINT ["/scratch/app"]
