TARGET = pvf

SRC_DIR = src
BIN_DIR = bin

CC = clang
CFLAGS = -Wall -Wextra -O2

SOURCES = $(wildcard $(SRC_DIR)/*.c)

OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BIN_DIR)/%.o)

all: $(BIN_DIR) $(BIN_DIR)/$(TARGET)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BIN_DIR)/$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BIN_DIR)

install: $(BIN_DIR)/$(TARGET)
	install -m 0755 $(BIN_DIR)/$(TARGET) /usr/local/bin

uninstall:
	rm -f /usr/local/bin/$(TARGET)

.PHONY: all clean install uninstall
