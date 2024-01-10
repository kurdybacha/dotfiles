# Build ESP development docker image based on Arch Linux

Adjust $USER, $UID and $GID in Dockerfile with your username, user id and user's group id.
In console run:
```bash
make build
```

# Run Hello World

Connect your ESP development board e.g. `ESP32-H2-DevKitM-1` to your computer. `/dev/ttyUSB0` should become available.

Enter ESP docker:

```bash
make run
```

Copy and build example hello_world from ESP examples:
```bash
cp -R $IDF_PATH/examples/get-started/hello_world/ .
cd hello_world
idf.py set-target esp32-h2
idf.py build
```

After successfull build flash the board:

```
idf.py -p /dev/ttyUSB0 flash
```

Monitor board's output:

```
idf.py monitor
```
