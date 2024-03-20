####################### Development stage #######################
FROM golang:1.20.5-alpine3.18 AS development

# 作業ディレクトリの定義
WORKDIR /app_gin

# go.mod と go.sum を app_gin ディレクトリにコピー
COPY go.mod go.sum ./

# 指定されたモジュールをダウンロード
RUN go mod download

# ルートディレクトリの中身を app_gin フォルダにコピー
COPY . .

# ビルドするファイルを指定：main.go
RUN go build -o main /app_gin/main.go

# air インストール
RUN go get -u github.com/cosmtrek/air && go build -o /go/bin/air github.com/cosmtrek/air

# curl インストール
RUN apk --no-cache add curl

# .air.toml ファイルをコピー
COPY .air.toml ./

CMD ["air", "-c", ".air.toml"]

####################### Production stage #######################
FROM alpine:3.18 AS production

# 作業ディレクトリの定義
WORKDIR /app_gin

# Development stage からビルドされた main だけを Production stage にコピー
COPY --from=development /app_gin/main .

CMD ["./main"]
