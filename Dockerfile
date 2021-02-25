FROM golang:1.15-alpine3.13 as stage1

WORKDIR /src

RUN echo 'package main;\
  import "fmt";\
  func main() {\
  fmt.Println("Code.education Rocks!");\
  }' >> main.go

RUN go build -ldflags "-w" -o app

FROM scratch

COPY --from=stage1 /src/app .

ENTRYPOINT [ "./app" ]

