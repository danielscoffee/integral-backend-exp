package routes

import (
	"errors"
	"net/http"
)

// Router struct 
type Router struct {
	ListRouter map[string]http.HandlerFunc 
}

func NewRouter() *Router {
	return &Router{
		ListRouter: make(map[string]http.HandlerFunc),
	}
}

func (r *Router) InsertRoute(path string, hf http.HandlerFunc) error {
	if _, exists := r.ListRouter[path]; exists {
		return errors.New("this route already exists")
	}

	r.ListRouter[path] = hf
	return nil
}

func (r *Router) GetRoutes() map[string]http.HandlerFunc {
	return r.ListRouter
}
