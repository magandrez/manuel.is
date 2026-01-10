HUGO     := hugo
SERVER   :=
DST_DIR  :=
ORIG_DIR := public
HUGO_OPTS := server -wD
RSYNC_OPTS := --verbose --archive --human-readable --progress --checksum --no-owner --no-group


all: build

build:
	$(HUGO)
	$(MAKE) clean

clean:
	find $(ORIG_DIR) -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) ! -name "*_hu*" -delete

deploy:
	@test -n "$(SERVER)" || (echo "SERVER is not set"; exit 1)
	@test -n "$(DST_DIR)" || (echo "DST_DIR is not set"; exit 1)
	$(MAKE) build
	rsync $(RSYNC_OPTS) $(ORIG_DIR)/ $(SERVER):$(DST_DIR)

serve:
	$(HUGO) $(HUGO_OPTS)

.PHONY: all build deploy clean
