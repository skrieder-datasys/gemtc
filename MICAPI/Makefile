CC        := icc -g -Wall -O3 -openmp -offload-build -Wno-unknown-pragmas -openmp-report
LD        := icc -lpthread -g -Wall -O3 -openmp -offload-build -Wno-unknown-pragmas -openmp-report

MODULES   := base kernels drivers lib
SRC_DIR   := $(addprefix src/,$(MODULES))
BUILD_DIR := $(addprefix build/,$(MODULES))

SRC       := $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.c))
OBJ       := $(patsubst src/%.c,build/%.o,$(SRC))
INCLUDES  := $(addprefix -I,$(SRC_DIR))

EXECUTABLE := mdproxy

vpath %.c $(SRC_DIR)

define make-goal
$1/%.o: %.c
	$(CC) $(INCLUDES) -c $$< -o $$@
endef

.PHONY: all checkdirs clean

all: checkdirs $(EXECUTABLE)

$(EXECUTABLE): $(OBJ)
	$(LD) $^ -o $@


checkdirs: $(BUILD_DIR)

$(BUILD_DIR):
	@mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(EXECUTABLE)


$(foreach bdir,$(BUILD_DIR),$(eval $(call make-goal,$(bdir))))
