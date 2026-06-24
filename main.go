package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

func main() {
	// Переводим Gin в релизный режим для чистоты логов
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
			"time":    time.Now().Format(time.RFC3339),
		})
	})

	// Эндпоинт с нагрузкой на CPU для симуляции реальной работы
	r.POST("/hash", func(c *gin.Context) {
		password := c.DefaultQuery("password", "secret_devops_2026")
		
		// Хэшируем строку с высокой солью для симуляции криптографии
		hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 12)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"status": "success",
			"hash":   string(hashedPassword),
		})
	})

	println("Сервер успешно запущен на порту :8080")
	r.Run(":8080")
}