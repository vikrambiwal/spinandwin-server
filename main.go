package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {

	url := "http://127.0.0.1:3000/login?email=test7@gmail.com&password=qwetyui"

	req, _ := http.NewRequest("POST", url, nil)

	req.Header.Add("cache-control", "no-cache")
	req.Header.Add("Postman-Token", "e8d8e71e-39ee-43a3-8e33-391e63d22a8b")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
