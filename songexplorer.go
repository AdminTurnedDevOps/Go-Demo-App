package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
)

func main() {
	sqlPath := "root:root@/todolist?charset=utf8&parseTime=True&loc=Local"
	db, err := gorm.Open("mysql", sqlPath)

	if err != nil {
		log.Fatal("Connection to database failed")
	}

	defer db.Close()

	router := mux.NewRouter()
	router.HandleFunc("/createsong", songExplorerCreate).Methods("POST")
	router.HandleFunc("/updatesong", songExplorerUpdate).Methods("POST")
	router.HandleFunc("/deletesong", songExplorerDelete).Methods("POST")
	http.ListenAndServe(":8000", router)
}

func songExplorerCreate(w http.ResponseWriter, r *http.Request) {

	fmt.Println("WIP")
}

func songExplorerUpdate(w http.ResponseWriter, r *http.Request) {

	fmt.Println("WIP")
}

func songExplorerDelete(w http.ResponseWriter, r *http.Request) {

	fmt.Println("WIP")
}
