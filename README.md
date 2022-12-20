# inkscape0.92-vnc-on-docker
Docker image that contains a specific version (0.92) of Inkscape where it's possible to use it through VNC.


### Introduction
I deciced to create this image, because I have to use a plugin that generates GCODEs for CNC machines. However, this plugin works only on older versions of Inkscape.

Unfortunatelly, on newer versions of Inkscape the [MI-GRBL-Z-AXIS-Servo-Controller](https://github.com/ikae/MI-GRBL-Z-AXIS-Servo-Controller) plugin doesn't work properly (I believe that is something related to python3). So, I had to create this image in order to have a way to generate the GCODEs properly.

### Clone
```bash
git clone https://github.com/thiagosanches/inskcape0.92-vnc-on-docker.git
cd inskcape0.92-vnc-on-docker
```

### Build
```bash
docker-compose build
```

### Run
```bash
docker-compose up
```

### Change the mount volume permissions
```bash
sudo chmod 777 -R ./datagcodez
```

### Connect it through VNC
I suggest you to use the [Remmina](https://remmina.org/) application. Create a new connection to: `localhost:5901`, type the password `forabozo` and you should be good! You can save the generated GCODEs file into `/tmp/gcodez`, and you'll be able to get it from the host computer.
