# Error al setear image en Kubernetes => too many links

- Posiblemente venga derivado de que hay muchas imagenes en el cluster
y kube no las está borrando apropiadamente.

- Revisar que tienes acceso por ssh al puerto 22 de los nodos (revisar grupo de seguridad asociado al nodo, y si tu ip no está tendrá que añadirla)

https://docs.aws.amazon.com/es_es/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-get-info-about-instance

- Revisar que la clave tenga permiso 0400

chmod 400 /path/my-key-pair.pem

- Conectarse a los nodos

```bash
ssh -i "C:\Users\Jose\Downloads\josedelrio85.pem" admin@ec2-3-249-254-248.eu-west-1.compute.amazonaws.com

ssh -i "C:\Users\Jose\Downloads\josedelrio85.pem" admin@ec2-3-250-71-147.eu-west-1.compute.amazonaws.com
```

```bash
ssh -i "/home/jose/Descargas/josedelrio85"  admin@ec2-3-249-254-248.eu-west-1.compute.amazonaws.com

ssh -i "/home/jose/Descargas/josedelrio85" admin@ec2-3-250-71-147.eu-west-1.compute.amazonaws.com
```

- Echar un ojo al espacio libre

```bash
df
```

- Cuenta el numero de imagenes actuales

```bash
sudo docker images | wc -l
```

- Remove all unused images, not just dangling ones

```bash
sudo docker image prune -a 
```

- Comprueba cuantas imagenes hay ahora

```bash
sudo docker images | wc -l
```
