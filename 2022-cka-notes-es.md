# CKA 2022 exam notes

Some **Spanish** Kubernetes notes related to CKA training (dated 2022). The original content was written on a personal Confluence site and exporting it to Markdown didn't work very well, so I apologize for the bad Markdown syntax practices.

Notas de Kubernetes para CKA en Español (2022). El contenido original estaba escrito en un sitio de Confluence personal y exportarlo a Markdown no funcionó muy bien, por lo que me disculpo por las malas prácticas de sintaxis de Markdown.

* 1 [Conceptos](#:info:-Conceptos)
  * 1.1 [Generales](#generales)
    * 1.1.1 [Clúster](#Clúster)
    * 1.1.2 [Recursos](#recursos)
    * 1.1.3 [Enfoque Imperativo](#enfoque-imperativo)
    * 1.1.4 [Enfoque Declarativo](#enfoque-declarativo)
    * 1.1.5 [Manifiesto](#manifiesto)
      * 1.1.5.1 [Estados de un manifiesto](#estados-de-un-manifiesto)
    * 1.1.6 [Label](#label)
      * 1.1.6.1 [Label Selector](#label-selector)
        * 1.1.6.1.1 [Queries con Label Selector](#queries-con-label-selector)
    * 1.1.7 [Annotation](#annotation)
  * 1.2 [Lenguajes](#[hardBreak]Lenguajes)
    * 1.2.1 [YALM](#yalm)
      * 1.2.1.1 [Pares clave-valor](#pares-clave-valor)
      * 1.2.1.2 [Array](#array)
      * 1.2.1.3 [Map o Diccionario](#map-o-diccionario)
    * 1.2.2 [JSON (JavaScript Object Notation)](#JSON-(JavaScript-Object-Notation))
      * 1.2.2.1 [Queries (JSONPath)](#Queries-(JSONPath))
      * 1.2.2.2 [Array](#Array.1)
      * 1.2.2.3 [Map o Diccionario](#Map-o-Diccionario.1)
      * 1.2.2.4 [JSONPath en K8s](#jsonpath-en-k8s)
        * 1.2.2.4.1 [Operaciones complejas - Columnas y orden](#operaciones-complejas---columnas-y-orden)
        * 1.2.2.4.2 [Queries condicionales](#queries-condicionales)
  * 1.3 [Master components](#master-components)
    * 1.3.1 [Kube-APIServer](#kube-apiserver)
    * 1.3.2 [ETCD](#etcd)
      * 1.3.2.1 [Funcionamiento](#funcionamiento)
      * 1.3.2.2 [Alta disponibilidad](#alta-disponibilidad)
      * 1.3.2.3 [Uso clásico](#Uso-clásico)
      * 1.3.2.4 [Uso en Kubernetes](#uso-en-kubernetes)
    * 1.3.3 [Kube Controller Manager](#kube-controller-manager)
      * 1.3.3.1 [Ejemplos de controllers](#ejemplos-de-controllers)
      * 1.3.3.2 [Cloud controller manager](#cloud-controller-manager)
    * 1.3.4 [Kube-Scheduler](#kube-scheduler)
      * 1.3.4.1 [Criterios de decisión](#Criterios-de-decisión)
      * 1.3.4.2 [Custom-Scheduler (Scheduler personalizado)](#Custom-Scheduler-(Scheduler-personalizado))
    * 1.3.5 [Container Runtime Interface (CRI)](#Container-Runtime-Interface-(CRI))
  * 1.4 [Otros componentes](#otros-componentes)
    * 1.4.1 [Namespace](#namespace)
      * 1.4.1.1 [ResourceQuota](#resourcequota)
    * 1.4.2 [Container](#container)
      * 1.4.2.1 [Imagen](#imagen)
      * 1.4.2.2 [Comandos y argumentos](#comandos-y-argumentos)
    * 1.4.3 [Pod](#pod)
      * 1.4.3.1 [MultiContainer](#multicontainer)
      * 1.4.3.2 [InitContainers](#initcontainers)
      * 1.4.3.3 [Afinidad](#afinidad)
        * 1.4.3.3.1 [Taints and tolerations](#taints-and-tolerations)
        * 1.4.3.3.2 [Node Selectors](#node-selectors)
        * 1.4.3.3.3 [Node Affinity and Anti-Affinity](#[hardBreak]Node-Affinity-and-Anti-Affinity)
        * 1.4.3.3.4 [Combinación de Node Affinity y Taints/Tolerations](#[hardBreak]Combinación-de-Node-Affinity-y-Taints/Tolerations)
      * 1.4.3.4 [Resources and Requests](#resources-and-requests)
        * 1.4.3.4.1 [Equivalencias de unidades](#equivalencias-de-unidades)
        * 1.4.3.4.2 [Acciones de límites:](#Acciones-de-límites:)
        * 1.4.3.4.3 [Valores por defecto](#valores-por-defecto)
      * 1.4.3.5 [Variables de entorno](#variables-de-entorno)
    * 1.4.4 [Node](#node)
      * 1.4.4.1 [Node-Components](#node-components)
      * 1.4.4.2 [Kubelet](#kubelet)
        * 1.4.4.2.1 [Kube-Proxy](#kube-proxy)
      * 1.4.4.3 [Static Pods](#static-pods)
    * 1.4.5 [Replica Set](#replica-set)
    * 1.4.6 [Deployment](#deployment)
      * 1.4.6.1 [Tipos de despliegue](#tipos-de-despliegue)
        * 1.4.6.1.1 [Rolling Update](#rolling-update)
        * 1.4.6.1.2 [Recreate](#recreate)
    * 1.4.7 [Service](#service)
      * 1.4.7.1 [Tipos de servicio](#tipos-de-servicio)
        * 1.4.7.1.1 [LoadBalancer](#loadbalancer)
        * 1.4.7.1.2 [NodePort](#nodeport)
        * 1.4.7.1.3 [ClusterIp](#clusterip)
        * 1.4.7.1.4 [Headless (acéfalo)](#Headless-(acéfalo))
      * 1.4.7.2 [Especificaciones](#especificaciones)
    * 1.4.8 [DaemonSet](#daemonset)
    * 1.4.9 [StatefulSet](#statefulset)
    * 1.4.10 [ConfigMap](#configmap)
    * 1.4.11 [Secreto](#secreto)
      * 1.4.11.1 [Niveles de seguridad](#niveles-de-seguridad)
      * 1.4.11.2 [Codificar/decodificar en Base 64](#Codificar/decodificar-en-Base-64)
* 2 [![:mag:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f50d.png) Observabilidad](#🔍-Observabilidad)
  * 2.1 [Monitoreo](#monitoreo)
    * 2.1.1 [Metric Server (Ex Heapster)](#Metric-Server-(Ex-Heapster))
      * 2.1.1.1 [Comandos](#comandos)
  * 2.2 [Logging](#logging)
* 3 [![:hammer:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f528.png) Mantenimiento del clúster](#🔨-Mantenimiento-del-clúster)
  * 3.1 [Mantenimiento de nodos](#mantenimiento-de-nodos)
    * 3.1.1 [Operaciones](#operaciones)
      * 3.1.1.1 [Drain](#drain)
      * 3.1.1.2 [Cordon](#cordon)
* 4 [![:cd:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4bf.png) Actualización del clúster](#💿-Actualización-del-clúster)
  * 4.1 [Versionado de Kubernetes](#versionado-de-kubernetes)
  * 4.2 [Planeamiento previo](#planeamiento-previo)
  * 4.3 [Cómo actualizar](#Cómo-actualizar)
    * 4.3.1 [Actualizar con Kubeadm](#actualizar-con-kubeadm)
      * 4.3.1.1 [Vista previa](#vista-previa)
      * 4.3.1.2 [Comandos](#Comandos.1)
* 5 [![:floppy_disk:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4be.png) Respaldo/Backup del clúser](#💾-Respaldo/Backup-del-clúser)
  * 5.1 [Respaldo de Manifiestos](#respaldo-de-manifiestos)
  * 5.2 [Respaldo de ETCD](#respaldo-de-etcd)
* 6 [![:key:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f511.png) Seguridad](#🔑-Seguridad)
  * 6.1 [Nodos](#nodos)
  * 6.2 [Comunicación entre componentes](#Comunicación-entre-componentes)
  * 6.3 [Mecanismos de seguridad en un clúster](#Mecanismos-de-seguridad-en-un-clúster)
    * 6.3.1 [Autenticación/Authentication](#Autenticación/Authentication)
    * 6.3.2 [Autorización/Authorization](#Autorización/Authorization)
      * 6.3.2.1 [Mecanismos de autorización](#Mecanismos-de-autorización)
      * 6.3.2.2 [ABAP](#abap)
      * 6.3.2.3 [RBAC](#rbac)
        * 6.3.2.3.1 [Comandos](#Comandos.2)
        * 6.3.2.3.2 [Role definition](#role-definition)
        * 6.3.2.3.3 [Role binding](#role-binding)
        * 6.3.2.3.4 [ClusterRole](#clusterrole)
        * 6.3.2.3.5 [Cluster Role binding](#cluster-role-binding)
    * 6.3.3 [Service Account](#service-account)
      * 6.3.3.1 [Comandos](#Comandos.3)
  * 6.4 [Complementario: Certificados TLS](#Complementario:-Certificados-TLS)
    * 6.4.1 [Encripción simétrica](#Encripción-simétrica)
    * 6.4.2 [Encripción asimétrica](#Encripción-asimétrica)
      * 6.4.2.1 [Llaves SSH en Linux](#llaves-ssh-en-linux)
      * 6.4.2.2 [Llaves para HTTP](#llaves-para-http)
    * 6.4.3 [Combinación de encripción simétrica y asimétrica](#Combinación-de-encripción-simétrica-y-asimétrica)
    * 6.4.4 [Uso de certificados - Public Key Infrastructure (PKI)](#Uso-de-certificados---Public-Key-Infrastructure-(PKI))
      * 6.4.4.1 [Autoridad certificante (Certification Authority)](#Autoridad-certificante-(Certification-Authority))
    * 6.4.5 [Uso en Kubernetes](#Uso-en-Kubernetes.1)
      * 6.4.5.1 [Comandos TLS para Linux](#comandos-tls-para-linux)
        * 6.4.5.1.1 [Generar certificado autofirmado para CA](#generar-certificado-autofirmado-para-ca)
        * 6.4.5.1.2 [Generar certificado para usuarios (Admins)](#Generar-certificado-para-usuarios-(Admins))
        * 6.4.5.1.3 [Generar certificado para componentes del sistema](#generar-certificado-para-componentes-del-sistema)
        * 6.4.5.1.4 [Ver detalles de un certificado](#ver-detalles-de-un-certificado)
        * 6.4.5.1.5 [Ver detalles de un CertificateSigningRequest](#ver-detalles-de-un-certificatesigningrequest)
        * 6.4.5.1.6 [Llamado API con certificados](#llamado-api-con-certificados)
    * 6.4.6 [Certificado de Kube-APIServer](#certificado-de-kube-apiserver)
      * * 6.4.6.1.1 [Certificados de Nodos o Kubeletes](#certificados-de-nodos-o-kubeletes)
      * 6.4.6.2 [Estado de salud TLS de un clúster](#Estado-de-salud-TLS-de-un-clúster)
    * 6.4.7 [Uso en ETCD](#uso-en-etcd)
    * 6.4.8 [Certificates API](#certificates-api)
      * 6.4.8.1 [Crear un usuario nuevo](#crear-un-usuario-nuevo)
      * 6.4.8.2 [Comandos de Certificates API](#comandos-de-certificates-api)
    * 6.4.9 [Configuración de Kubectl - Kubeconfig](#Configuración-de-Kubectl---Kubeconfig)
      * 6.4.9.1 [Ubicación del archivo](#Ubicación-del-archivo)
      * 6.4.9.2 [Contenido del archivo](#contenido-del-archivo)
  * 6.5 [Encryption at rest](#encryption-at-rest)
  * 6.6 [API Groups](#api-groups)
    * 6.6.1 [Core](#core)
    * 6.6.2 [Named](#named)
    * 6.6.3 [Otras consultas API](#otras-consultas-api)
    * 6.6.4 [Authenticación API con Kubectl Proxy](#Authenticación-API-con-Kubectl-Proxy)
  * 6.7 [Image Security](#image-security)
    * 6.7.1 [Repositorio Privado](#repositorio-privado)
  * 6.8 [Security Contexts](#security-contexts)
    * 6.8.1 [Capabilities](#capabilities)
  * 6.9 [Network Policy](#network-policy)
    * 6.9.1 [Habilitar todo el tráfico](#Habilitar-todo-el-tráfico)
    * 6.9.2 [Habilitar todo el tráfico para un pod](#Habilitar-todo-el-tráfico-para-un-pod)
    * 6.9.3 [Habilitar uso de DNS interno](#habilitar-uso-de-dns-interno)
    * 6.9.4 [Denegar todo el tráfico](#Denegar-todo-el-tráfico)
    * 6.9.5 [Aclaración importante sobre los Arrays y los Diccionarios en una NetPol](#Aclaración-importante-sobre-los-Arrays-y-los-Diccionarios-en-una-NetPol)
      * 6.9.5.1 [Comandos de Netwrok Policies](#comandos-de-netwrok-policies)
* 7 [![:file_cabinet:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f5c4.png) Almacenamiento](#🗄-Almacenamiento)
  * 7.1 [Storage en Docker](#storage-en-docker)
  * 7.2 [Storage Drivers](#storage-drivers)
  * 7.3 [Volume Drivers](#volume-drivers)
  * 7.4 [Container Runtime Interface (CRI)](#Container-Runtime-Interface-(CRI).1)
  * 7.5 [Container Storage Interface (CSI)](#Container-Storage-Interface-(CSI))
  * 7.6 [Volumes (Volúmenes)](#Volumes-(Volúmenes))
    * 7.6.1 [Persistent Volume](#[hardBreak]Persistent-Volume)
    * 7.6.2 [Persistent Volume Claim](#persistent-volume-claim)
    * 7.6.3 [Storage Classes](#storage-classes)
* 8 [![:globe_with_meridians:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f310.png) Networking](#🌐-Networking)
  * 8.1 [Comandos de Networking](#comandos-de-networking)
    * 8.1.1 [En Linux](#en-linux)
    * 8.1.2 [Trabajar con Namespaces en Linux](#trabajar-con-namespaces-en-linux)
    * 8.1.3 [En Docker](#en-docker)
  * 8.2 [Networking en Docker](#networking-en-docker)
  * 8.3 [Container Networking Interface (CNI)](#Container-Networking-Interface-(CNI))
    * 8.3.1 [Obligaciones del estándar](#Obligaciones-del-estándar)
  * 8.4 [Conexión de containers a la red](#Conexión-de-containers-a-la-red)
    * 8.4.1 [Forma general](#forma-general)
    * 8.4.2 [Estándar definido por CNI](#Estándar-definido-por-CNI)
  * 8.5 [Red en Kubernetes](#red-en-kubernetes)
    * 8.5.1 [Node Layer](#node-layer)
    * 8.5.2 [Pod Layer](#pod-layer)
      * 8.5.2.1 [Requerimientos de modelo de red](#requerimientos-de-modelo-de-red)
      * 8.5.2.2 [IP Address Assignment Management (IPAM)](#IP-Address-Assignment-Management-(IPAM))
    * 8.5.3 [Uso de CNI en K8s](#uso-de-cni-en-k8s)
    * 8.5.4 [Weave Net CNI (Network Plugin)](#Weave-Net-CNI-(Network-Plugin))
  * 8.6 [Service Networking](#service-networking)
  * 8.7 [DNS en Kubernetes](#dns-en-kubernetes)
    * 8.7.1 [Kube-DNS (default)](#Kube-DNS-(default))
    * 8.7.2 [DNS para services](#dns-para-services)
    * 8.7.3 [DNS para pods](#dns-para-pods)
    * 8.7.4 [Core-DNS](#core-dns)
  * 8.8 [Ingress](#[hardBreak]Ingress)
    * 8.8.1 [Ingress controllers](#ingress-controllers)
      * 8.8.1.1 [Annotations](#annotations)
    * 8.8.2 [Ingress Route](#ingress-route)
    * 8.8.3 [Ingress class](#ingress-class)
    * 8.8.4 [Caso de Service tipo Load Balancer](#caso-de-service-tipo-load-balancer)
    * 8.8.5 [Comandos Ingress](#comandos-ingress)
* 9 [![:diamond_shape_with_a_dot_inside:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4a0.png) Diseño de un clúster Kubernetes](#[hardBreak][hardBreak]💠-Diseño-de-un-clúster-Kubernetes)
  * 9.1 [Alta disponibilidad (High Availability)](#Alta-disponibilidad-(High-Availability))
    * 9.1.1 [HA en componentes Stateful de Kubernetes](#ha-en-componentes-stateful-de-kubernetes)
    * 9.1.2 [ETCD en HA](#etcd-en-ha)
  * 9.2 [Opciones de despliegue](#opciones-de-despliegue)
    * 9.2.1 [Creación manual de un clúster (Hard Way)](#Creación-manual-de-un-clúster-(Hard-Way))
    * 9.2.2 [TLS Bootstrapping](#tls-bootstrapping)
    * 9.2.3 [Creación de un clúster con Kubeadm](#Creación-de-un-clúster-con-Kubeadm)
* 10 [![:question:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/2753.png) Troubleshooting](#❓-Troubleshooting)
  * 10.1 [Application](#application)
  * 10.2 [Control Plane](#control-plane)
  * 10.3 [Worker Node](#worker-node)
  * 10.4 [Networking](#networking)
* 11 [![:scroll:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4dc.png) Comandos (Kubectl)](#📜-Comandos-(Kubectl))
  * 11.1 [Banderas/flags o parámetros](#Banderas/flags-o-parámetros)
    * 11.1.1 [Correr en modo simulación](#Correr-en-modo-simulación)
    * 11.1.2 [Cambiar formato de salida](#cambiar-formato-de-salida)
    * 11.1.3 [Selector por Labels](#selector-por-labels)
  * 11.2 [Generales](#Generales.1)
    * 11.2.1 [Obtener info. del cluster](#Obtener-info.-del-cluster)
    * 11.2.2 [Ver configuración actual](#Ver-configuración-actual)
    * 11.2.3 [Identificar perfil de configuración en uso](#Identificar-perfil-de-configuración-en-uso)
    * 11.2.4 [Ver objetos](#ver-objetos)
    * 11.2.5 [Ver eventos](#ver-eventos)
    * 11.2.6 [Desplegar con un manifiesto YAML](#desplegar-con-un-manifiesto-yaml)
    * 11.2.7 [Editar un recurso desplegado en memoria](#editar-un-recurso-desplegado-en-memoria)
  * 11.3 [Cargas de trabajo](#cargas-de-trabajo)
    * 11.3.1 [Crear pod](#crear-pod)
    * 11.3.2 [Exponer un pod](#exponer-un-pod)
    * 11.3.3 [Crear deployment](#crear-deployment)
    * 11.3.4 [Conectarse a Bash de un POD](#conectarse-a-bash-de-un-pod)
    * 11.3.5 [Crear servicio (exponer pods)](#Crear-servicio-(exponer-pods))
    * 11.3.6 [Poner un label a un pod](#poner-un-label-a-un-pod)
    * 11.3.7 [Escalar un deployment](#escalar-un-deployment)
    * 11.3.8 [Actualizar un despliegue](#actualizar-un-despliegue)
    * 11.3.9 [Hacer un rollback de despliegue](#hacer-un-rollback-de-despliegue)
    * 11.3.10 [Cambiar imagen de despliegue](#cambiar-imagen-de-despliegue)
    * 11.3.11 [Forwardear puerto local a Kubernetes](#forwardear-puerto-local-a-kubernetes)
    * 11.3.12 [Reiniciar un deployment sin re-deployar](#reiniciar-un-deployment-sin-re-deployar)
    * 11.3.13 [Desplegar con un manifiesto YAML](#Desplegar-con-un-manifiesto-YAML.1)
    * 11.3.14 [Invocar un servicio por FQDN](#invocar-un-servicio-por-fqdn)
    * 11.3.15 [Ver logs de un pod](#ver-logs-de-un-pod)
  * 11.4 [Otros](#otros)
  * 11.5 [Obtener info de recursos API](#obtener-info-de-recursos-api)
    * 11.5.1 [Debugear DNS](#debugear-dns)
    * 11.5.2 [Crear Config-Map](#crear-config-map)
    * 11.5.3 [Crear secreto](#crear-secreto)
    * 11.5.4 [Esperar una condicion](#esperar-una-condicion)

![:info:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/atlassian/info_64.png) Conceptos
===========================================================================================================

Generales
---------

_Names_ o Nombres: Identificador a nivel API para un objeto de Kubernetes, que consta de hasta 253 caracteres alfanuméricos, con guiones medios/bajos y/o puntos.

_UID_: Identificador único para un objeto de Kubernetes, que el mismo sistema genera de forma automática y aleatoria.

### Clúster

Grupo coordinado de _computadoras_ que trabajan como una sola unidad. Los _miembros_ (o _workers_) se llaman nodos. Luego -en el caso de _Kubernetes_\- el _Control Plane_ administra y orquesta esas computadoras, además de exponer la _API de Kubernetes_ que utiliza para conectarse con los nodos y para que el usuario interactue con el cluster en sí.

Open image-20210528-235521.png

![image-20210528-235521.png](blob:https://juannfox.atlassian.net/173192e3-3529-40d8-8d24-2bf9049c0d79#media-blob-url=true&id=d5388231-5f5a-4b8f-8f30-da26b74cb0b4&collection=contentId-2260993&contextId=2260993&width=476&height=385&alt=)

Un cluster productivo debe tener al menos tres nodos (números impares con un mínimo de 3). Esto se debe a motivos de alta disponibilidad.

### Recursos

Objetos de _Kubernetes_ con cierta funcionalidad y una estructura personalizada, definida por _K8s_ o incluso por algun tercero (_CustomResourceDefinition_).

Pueden ser _namespaced_ o _clusterscoped_ (asociables a un _Namespace_, o universales al cluster, según corresponda).

### Enfoque Imperativo

Enfoque donde los comandos utilizados son de instrucciones explícitas y deben proveerse manualmente los recursos necesarios para lograr un fin.
Los comandos imperativos de kubernetes son: `kubectl create/run/expose/update`, etc.

### Enfoque Declarativo

A diferencia del enfoque Imperativo, en este enfoque particular todas las tareas las realiza el software, a quien solo debemos solicitarle una configuración estática que luego interpreta y dispara todas las acciones necesarias.
Los comandos `kubectl apply -f` y `create -f` (provistos de un manifiesto) son declarativos.

### Manifiesto

Un _manifiesto_ es un archivo que declara características y estado de un objeto/recurso de _Kubernetes_. El lenguaje utilizado para estos manifiestos es _YAML_.

Si bien existen manifiestos para todo tipo de recursos, a gran escala se puede visualizar siempre la estructura básica:

`apiVersion: <Version de la API> kind: <Tipo de recurso u objeto> metadata: #Identificadores de objeto name: <nombre> labels: <etiqueta1>: <valor1> spec: <Configuraciones de objeto>`

Las secciones _Metadata_ y _Spec_ tienen formato de diccionario, con una estructura de jerarquías (valores padre e hijos).

Las listas/arrays arrancan sus items con “-”. La diferencia con -por ejemplo- los labels de Metadata es que los items tienen propiedades hijas (estos son diccionarios, no listas).

Las listas o arrays se pueden utilizar de las dos formas descritas a continuación:
\-Utilizando items ordenados con “`-`".
\-Utilizando lista CSV entre corchetes, con sus valores entre comillas: `["1","2","3"]`

#### Estados de un manifiesto

Un manifiesto tiene tres “stages” o etapas:

1)**Manifiesto del usuario (YAML):** Utilizado mediante Kubectl Apply por el usuario

2)**Last applied configuration (JSON):** Versión JSON de la última configuración aplicada por el usuario, osea el archivo utilizado para crear el objeto. También se almacena sobre el archivo en vivo como una annotation llamada _kubectl.kubernetes.io/last-applied-configuration_.

3)**Live update configuration:** Versión en memoria del manifiesto (YAML) que tiene propiedades extra que denotan el estado del objeto en vivo (runtime).

Cuando se hace un cambio en el manifiesto local y se aplica, este se compara con el manifiesto en vivo y luego se aplica. Luego, este cambio se traslada al archivo de última configuración (este último sirve como referencia).

Los manifiestos en runtime tienen campos extra con información de estado, almacenados en memoria.

Como una de las ventajas de trabajar con manifiestos es la posibilidad de tener un respaldo de como código en un repositorio de la infraestructura, no es recomendado hacer cambios imperativos “en vivo” sobre los objetos desplegados en Kubernetes, ya que ese cambio queda solo en memoria y no en el manifiesto almacenado como archivo por el usuario.

### Label

Atributo de tipo par _key:_value, que se puede definir en un manifiesto de un recurso. Luego un _selector_ de servicio puede identificar ese valor, por ejemplo (o simplemente servir como etiqueta/tag).

Debe tener máximo 63 carateres y ser un subdominio DNS válido. En caso de incluir un prefijo (no obligatorio), se lo separa con “/” y tiene máximo 253 caracteres.

#### Label Selector

Permite identificar aquellos objetos que contengan cierto Label. Los operadores posibles son **\=** y **!=**, aunque también soporta listas con los operadores **in**, **notin** y **exists**:

`role = webserver role != webserver role in (webserver,httpserver)`

##### Queries con Label Selector

`kubectl get pods -l environment=production,tier=frontend kubectl get pods -l 'environment in (production,qa),tier notin (frontend)'`

### Annotation

Metadato de tipo par _key:value_ que sirve únicamente para cargar de información distintiva a un objeto de Kubernetes.

Algunas integraciones no nativas de Kubernetes aprovechan estos campos para inyectar configuraciones extra (ejemplo Ingress Controllers).

Lenguajes
------------

Es facil convertir valores entre _YAML_ y _JSON_, o viceversa.

### YALM

Es un lenguaje que representa propiedades, soportando pares _clave: valor_ (separados por un espacio), arrays/vectores (o listas) y maps o diccionarios. La indentación es obligatoria y debe ser consistente, representada con espacios.

Los comentarios se hacen con el caracter “#”.

#### Pares clave-valor

`clave1: valor1 clave2: valor 2`

#### Array

`clave1: - subclave1: subvalor 2 - subclave2: subvalor1`

#### Map o Diccionario

`clave1: subclave1: subvalor1 subclave2: subvalor2`

No tiene orden de subitems.

Es posible combianr _Arrays_ y _Diccionarios_.

### JSON (JavaScript Object Notation)

Lenguaje estructurado de Java que representa datos, soportando pares _clave: valor_ (separados por un espacio), _arrays_/_vectores_ (o _listas_) y _maps_ o _diccionarios_. La indentación es obligatoria y debe ser consistente, representada con espacios.

_JSON_ es un objeto válido de _Javascript_, por lo que puede utilizarse en dicho lenguaje para almacenar información.

* Tipos de datos: String, número (no difiere entre Int o Float), Boolean (True o False), Nulo (null) y objeto ({“clave”,”valor”}.

* Comentarios: No existen.

Para convertir un _JSON_ en formato _String_ a un _JSON_ válido en _Javascript_ se utiliza _JSON.parse()_. El procedimiento inverso es _JSON.stringify()_.

#### Queries (JSONPath)

Similar a trabajar con objetos, los campos de un item se pueden obtener con queries usando puntos, indicando la propiedad del item:

`item1.propiedad1.subpropiedad1`

El _elemento de nivel superior_ (o top level) se llama _root_ y se utiliza con el caracter “**$**”:

`$.item1.propiedad1.subpropiedad1`

Los resultados vienen dentro de un array (\[\]).

Para queries sobre listas, se utiliza la posición (similar a C++), iniciando en 0:

`$[0].item1.propiedad1.subpropiedad1`

Luego para seleccionar múltples elementos utilizar el caracter “,” e indicar inicio,fin:

`$[0,4]`

Para una selección específica, al igual que en _Pyhton_, utilizar el caracter “:” con formato \[inicio:final:intervalo\]:

`$.[0:4:2]`

Para el último item de la lista, se utiliza el índice inverso, que inicia con “-1” en el último elemento de la lista. Por lo que puede utilizarse:

`$[-1]`

O bien, en algunos casos:

`$[-1:0]`

Se pueden utilizar _criterios_ válidos para filtrar el resultado, ubicando la _condición_ dentro de los corchetes. El signo “?” abre el condicional y luego la condición se chequea dentro de los paréntesis como operación, donde “@” es el iterador de “todos los valores” (para chequeo cíclico). El operador puede ser: >, <, ==, !=, in o nin.

Ejemplo de uso:

`$[?(@>40)]`

Ejemplo avanzado:

`$.item1.subitem2[?(@.propiedadsubitem1 == "valorDeseado" )].(@.propiedadsubitem2`)

También se pueden combinar queries con comas:

`[?(query1),?(query2)]`

El caracter “\*” actua como _wildcard_ en los queries de _JSONPath_.

`$.*.subpropiedad1`

o bien para arrays:

`$.[*].subpropiedad1`

#### Array

Los Arrays se definen entre corchetes o brackets (\[\]) y sus subvalores entre llaves o curly braces ({}), mientras que cada item del array se separa por “,”.

`{ "clave1": { "subclave1": "subvalor2", "subclave2": [ { "clavearray1": "valorarray2", "clavearray1": "valorarray2", }, { "clavearray1": "valorarray2", "clavearray1": "valorarray2", } ] } }`

#### Map o Diccionario

Los items se definen entre llaves o curly braces ({}):

`{ "clave1": { "subclave1": "subvalor2", "subclave2": "subvalor2" } }`

#### JSONPath en K8s

[https://kubernetes.io/docs/reference/kubectl/jsonpath/](https://kubernetes.io/docs/reference/kubectl/jsonpath/)

El root “$” lo agrega Kubectl por defecto, por lo que puede omitirse.

Utilizar {“\\n”} crea nuevas líneas.

Usar comandos _kubectl_ con parámetro:

`--jsonpath <query>`

O bien

`-o=jsonpath='<query>'`

También se pueden combinar queries, utilizando “{}{}” para separarlas.

El operador “range” permite hacer un ciclo for sobre los resultados:

`{range .item[*]}{metadata.name}{end}`

##### Operaciones complejas - Columnas y orden

También se puede combinar con columnas personalizadas:

`kubectl get nodes -o=custom-columns=<nombreColumna1>:<query1><nombreColumna2>:<query2>`

Luego el parámetro `---sort-by` permite ordenar segun un _JSONPAth_.

##### Queries condicionales

Los queries con condicionales tienen un formato distinto. Ejemplo para obtener la IP de un nodo:

`kubectl get node <nodo> -o=jsonpath='{.status.addresses[?(.type == "InternalIP")].address}'`

Es importante entender que los comandos _GET_ de _K8s_ que se envían sin un nombre particular devuelven la lista de todos los elementos de ese tipo en el _Namespace_, dentro de un _Array_ llamado _Items_ (parte del objeto _List_ de _Kubernetes_). Esto afecta las queries, ya que cada elemento es un item del array de la lista.

Para obtener las IPs de todos los nodos, en cambio, no se envía el nombre del nodo y además se hace el query sobre el parent _items_, con el índice \* (wildcard):

`kubectl get node -o=jsonpath='{.items[*].status.addresses[?(.type == "InternalIP")].address}'`

Master components
-----------------

Los componentes maestros componen los clusters de _Kubernetes_ y pueden estar distribuidos en varios _nodos_, o sobre un único _nodo_.

Cada componente se conecta al clúster con perfiles de configuración guardados en archivos _Kubeconfig_ (de _Kubectl_) y asegura la conexión con _encriptación TLS_ punta a punta.

Las opciones de instalación incluyen:

1. Instalar cada componente como un _servicio_ de _Linux_ y proveerles la configuración _Kubeconfig_ y _TLS_ necesaria.

2. Aplicar _Kubernetes_ a _Kubernetes_, instalando los componentes como _Static Pods_ dentro de los nodos, gracias al _Kubelet_ \-que ya debe estar instalado como servicio- (incluyendo la configuración _Kubeconfig_ y _TLS_ necesaria).

Como la opción 2 es factible, entonces es posible armar un clúster de _K8s_ con solo el _Kubelet_ instalado. Este método es el utilizado por _Kubeadm_.

### Kube-APIServer

Expone la _Rest API_ de _Kubernetes_ (_control plane_) y es el componente principal. También se conoce como _Master_.

### ETCD

Es un tipo de base de datos distribuida de pares _clave:valor_ (key:value) que se caracteriza por ser confiable, rápida y segura. Se denomina como un _Distributed Configuration System_ (_DCS_) por el tipo de uso que recibe.

El puerto por defecto para el servicio es el 2379 (TCP).

Tiene dos APIs distintas, v2 (standard) y v3 (que se setea con la enviroment variable ETCDCTL\_API=3).

#### Funcionamiento

A diferencia de una base de datos _relacional_ (o _tabular_), donde una serie de “llaves” (o claves) son únicas y ordenan una serie de entradas que son compatibles con ese formato, en una base de datos _ETCD_ cada entrada está compuesta por un conjunto de llaves y valores (en formato llave:valor) y compone por si misma una estructura, sin necesidad de un esqueleto de “tabla” única (además de que puede o no variar en “largo” de otros objetos similares). Una estructura similar a la utilizada por este tipo de DB es el diccionario de _Python_ o el Hashtable de _Powershell_.

#### Alta disponibilidad

Idealmente el servicio debería estar clusterizado (tipo HA, High Abailability) con varias instancias y un _ETCD API Server_ (o master), segurizado mediante el uso de certificados TLS/SSL.

#### Uso clásico

En _Linux_ se instala como servicio y tiene una interfaz de línea de comando llamada _etcdctl_, similar a otras herramientas de dicho SO.

#### Uso en Kubernetes

En Kubernetes se implementa adoptando _HA_, usualmente desplegado como un _Static Pod_ sobre el nodo _ControlPlane_ y se utiliza el _CA_ (_Certification Authority_) de _Kube-APIServer_ o uno propio de _ETCD_. Cumple el rol de guardar información y estado de los diferentes componentes (nodos, pods, configs, secrets, accounts, roles, bindings, etc).

Nótese que es un rol crucial, ya que guarda el estado en vivo de los manifiestos de recursos desplegados en el clúster.

### Kube Controller Manager

Es un agente encargado de revisar el estado -y remediar posibles problemas- de los diferentes componentes de Kubernetes, lo cual hace mediante el uso del canal que provee el _Kube-APIServer_. Está compuesto por una serie de controladores, que se enfocan en diferentes tareas de forma permanente.

#### Ejemplos de controllers

El Node Controller, particularmente, utiliza probes de salud con cierta parametrización (frecuencia, período de gracia y plazo de desalojo de pods). Si un nodo está marcado como _unreachable_ (o _not ready_) por al menos el perído de gracia y el plazo de desalojo, le quita la asignación de sus pods y los re-asigna a otros nodos.

En cambio, el Replication Controller apunta a controlar que los _Replicasets_ cumplan la cantidad de pods que declaran, creando nuevos -y elminando pods con problemas- cuando sea necesario.

#### Cloud controller manager

Controlador del proveedor de nube que se integra con Kubernetes (si es soportado) y reemplaza ciertas funcionalidades del controlador _Kube_ nativo, para cederlas a la plataforma de hosting (roles, volúmenes, etc).

### Kube-Scheduler

Es un _planificador_ que se encarga de decidir -en base a ciertos criterios- en qué _nodos_ ubicar los _pods_ (las cargas de trabajo), lo cual se actualiza además de forma dinámica.

Notese que este componente no se encarga de crear el recurso, sino de decidir cuando y donde ubicarlo (en qué nodo). Luego la tarea de crear el recurso la realiza el _Kubelet_ del nodo correspondiente.

#### Criterios de decisión

Para decidir, primero filtra los nodos no compatibles (en base a la cantidad de recursos necesarios) y luego establece un ranking de los nodos restantes (en base a _recursos libres_), definiendo la/s mejor/es opcion/es. El _scheduler_ además interpreta reglas de _NodeAffinity/Anti-Affinity, NodeSelectors_ y _Taints/Tolerations_, tomándolas en cuenta al decidir en qué nodo ubicar una carga de trabajo.

Si no existiera el _scheduler_, sería posible hacer scheduling manual, agregando la propiedad _nodeName_ en la configuración _spec_ del pod.

#### Custom-Scheduler (_Scheduler personalizado)_

Se pueden tener varios _kube-scheduler_ (en casos de multi-master en un cluster), o incluso desplegar otros schedulers personalizados, idealmente como pod estáticos en un nodo. En este caso, entra en juego el proceso de _leader-election_ para definir cual de los schedulers de la misma clase es el lider y el parametro _\--lock-object-name_ para diferenciar los schedulers custom de los originales. El campo _scheudlerName_ en un pod le indica qué scheduler debe manejarlo.

Manifiesto de ejemplo del despliegue de un _Scheduler_ personalizado como pod:

Open

### Container Runtime Interface (CRI)

Es un motor compuesto por un conjunto de estándares, requerimientos, APIs _gRCP_ y librerias, que permite que los _container runtimes_ se integren con el _kubelet_.

El _kubelet_ no se debe comunicar directamente con un container runtime, ya que se comunica con ellos mediante el _CRI shim_ (una interfaz API) y por ende amplia la compatibilidad a cualquier runtime que sea _CRI compliant_.

Luego existen dos interfaces gRPC: _ImageService_ y _RuntimeService_, responsables por el manejo de imágenes y de contenedores, sucesivamente.

Es por esto que no solo las imágenes de _docker_ son compatibles con _Kubernetes_, sino cualquier imagen de _contenedor_ que cumpla el estándar _CRI_.

Open

Otros componentes
-----------------

### Namespace

División lógica dentro de un clúster que permite aislar objetos de kubernetes, proporcionandoles un ambiente con sus propias policies, recursos y red.

Se pueden invocar servicios de otro namespace utilizando el formato _<servicio>.<namespace>.svc.cluster.local_ (corresponde a una entrada _DNS_ autogenerada por el servicio).

Para setear un NS por defecto, utilizar el comando:

`kubectl config set-context $(kubectl config current-context) --namespace=MiNamespace`

Ejemplo de manifiesto:

`apiVersion: v1 kind: Namespace metadata: name: minombre`

#### ResourceQuota

Es posible definir una cuota de recursos a asignar a un _Namespace_, limitando la cantidad disponible dentro del mismo (que se complementa con la disponibilidad de los nodos):

`apiVersion: v1 kind: ResourceQuota metadata: name: minombre-quota namespace: minombre spec: hard: pods: 10 requests.cpu: 4 requests.memory: 5Gi`

### Container

Un contenedor es una abstracción en la capa de aplicación, que está compuesto por el código y sus dependencias, pero no por el sistema operativo en sí (a diferencia de una _Virtual Machine_); en pocas palabras, no tiene _Kernel_. Luego varios contenedores pueden convivir aislados sobre un mismo host, donde utilizan procesos separados.

Los containers que soporta Kubernetes son de tipo _Open Container Iniciative_ (_OCI_).

#### Imagen

Es una serie de instrucciones utilizadas para armar un contenedor.

#### Comandos y argumentos

Los containers tienen un ciclo de vida y no fueron concebidos para alojar un _SO_ (a diferencia de una _VM_). Por ende, muchas veces es necesario enviar un comando especial al container para que se mantenga “vivo” o activo.

Los comandos se pueden enviar como _string_ (1) o como _array_ (2):

1)`”<Comando> <Parametro1> <Parametro2>"`

2)`["Comando","Parametro1","Parametro2"]`

Los comandos pueden ejecutarse como parte de la imagen del contenedor, así como tambien especificados en el manifiesto del pod (sobreescribe el de la imagen).

En una imagen de docker, la propiedad _EntryPoint_ indica el binario a ejecutarse por defecto, al cual se le agregan los parámetros enviados al ejecutar la imagen (ej: Con “sleep” como _EntryPoint_, ejecutar la imagen con el parámetro “5” equivale a “sleep 5”). Al definir un comando (con _CMD_) por defecto, actua como el valor de parámetro por defecto para el _EntryPoint_:

`FROM python:3.6-alpine RUN pip install flask COPY . /opt/ EXPOSE 8080 WORKDIR /opt ENTRYPOINT ["python", "app.py"] CMD ["--color", "red"]`

En el ejemplo al iniciar el container se ejecuta “python appy.py --color red”, a no ser que se envíe un argumento, en cuyo caso se ejecuta “python app.py <argumento>”.

En la definición del pod, el campo _command_ se corresponde con el _EntryPoint_ del container y el campo _args_ con el de _CMD_ del container (a ambos los sobreescribe):

**POD**

**Imagen**

**POD**

**Imagen**

_command_

_EntryPoint_

_args_

_CMD_

Ejemplo:

`apiVersion: v1 kind: Pod metadata: name: webapp-green labels: name: webapp-green spec: containers: - name: simple-webapp image: kodekloud/webapp-color args: ["--color","green"]`

En el ejemplo, se ejecuta “python appy.py --color green” (en vez de “red” como dice en la imagen), porque los argumentos (Args) del YAML sobreescriben el comando (CMD) del container. Si en cambio se enviara un “command” en el YAML, este sobreescribiría el binario anunciado en el EntryPoint del archivo Docker.

### Pod

Unidad atómica de Kubernetes, que es prácticamente una máquina virtual liviana, donde corren uno o más _containers_ como procesos aislados, pero compartiendo recursos (red, almacenamiento, CPU y memoria).

Este recurso es el que aloja la carga de trabajo en _Kubernetes_ y es utilizado de una manera u otra por las diferentes abstracciones que la plataforma trae (_Deployments_, _Statefulsets_, _Daemonsets_ y _Jobs_).

Está pensado para ser efímero y logra eso gracias a que se basa en un _template_ declarativo (dentro de un manifiesto _YAML_) que le indica los parámetros de creación, asegurando que todas las instancias de recurso que se creen con el mismo sean idénticas (excepto por el _ID_ de recurso y la _IP_). Un _Pod_ no se reinicia, se elimina y se crea uno nuevo. Es por esto que no debe adoptarse afinidad con el mismo, sino considerarlo una “copia” o “clon” de una plantilla de recurso.

Como el _Pod_ no tiene persistencia, es de esperar que al reiniciarse -o eliminarse- se pierdan los datos escritos en memoria (y no solo _RAM_), por lo que el _Storage_ suele proveerse de forma externa. Además, la _IP_ cambia con cada reinicio (para lo cual existe un rango _DHCP_ de _IPs_ para _pods_) y no tiene nombres _DNS_ (si bien pueden agregarse, aunque no recomendados).

La forma de identificar la _IP_ de un _Pod_ -que cambia a menudo- sin _DNS_ es mediante el uso de _Labels_ (etiquetas sobre el mismo) y un _Selector_. Esto se explica posteriormente en la sección de _Servicios_.

#### MultiContainer

En ocasiones puede ser util correr múltples contenedores en un pod, ya que entre ellos comparten red y almacenamiento. Algunas aplicaciones requieren de un companion o una funcionalidad externa, que puede acoplarse de esa forma.

El YAML de definición del container es un array, por lo que -para añadir otro container- basta con agrega otro item (-).

Open

**\-Sidecar:** Cumple alguna funcion que se complementa con la aplicación y es de utilidad que compartan el host (pod).

**\-Adapter:** Para convertir el tipo de tráfico o los datos enviados a/desde la aplicación.

**\-Ambassador:** Actua como una especie de Proxy para la aplicación.

#### InitContainers

Todos los containers en un pod _MultiContainer_ deben mantenerse “vivos” para que el pod lo haga también; si uno falla o se apaga, el pod falla. Por eso los _InitCointaners_ son de utilidad, ya que corren una tarea y luego pueden dejar de funcionar, sin afectar al pod.

Nótese que los containers se crean solo cuando los _InitContainers_ corren su ciclo completo.

En caso de configurar varios containers de este tipo, corren en orden secuencial; si alguno de los _IC_ falla, el pod se reinicia.

Ejemplo de manifiesto:

`spec: containers:   - name: myapp-container     image: busybox:1.28     command: ['sh', '-c', 'echo The app is running! && sleep 3600']   initContainers:   - name: init-myservice     image: busybox     command: ['sh', '-c', 'git clone <some-repository-that-will-be-used-by-application> ; done;']`

#### Afinidad

##### Taints and tolerations

Marca (del inglés olor o mancha) que se aplica sobre un nodo para repeler pods que no tienen tolerancia al mismo. Luego se especifica _tolerance_ en los pods para que puedan “soportar” ciertos nodos que tienen _taints_ “aceptables”.

[https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

Cuando el scheduler desea asignar un pod a un nodo, pero encuentran taint al que no es tolerante, lo pasa a otro nodo y descarta ese.

Para marcar un nodo con un _taint_, utilizar el comando:

`kubectl taint nodes <nodeName> <key>=<value>:<taint-effect>`

Tipos de _Taint-Effect_:

**\-No Schedule:** No se asignan nuevos pods si no son tolerantes.

**\-Prefer No Schedule:** A no ser que sea el ultimo nodo disponible, no se aceptan asignaciones de pods no tolerantes.

**\-No execute:** No se asignan nuevos pods intolerantes Y no se ejecutan los que ya existen (_evict_).

Para agregar tolerancias a un Pod, agregar el siguiente template a spec:

Ejemplo de manifiesto:

`tolerations: -key : app operator: "Equal" value: "blue" effect: NoSchedule`

Nótese que la toleración describe el taint en sí.

Los taints/tolerations solo indican en que nodo no se puede asignar un pod, no en cual se va a terminar asignando; para eso existe podAffinity. Un pod solo puede asignarse a los nodos sobre los cuales no tenga “alergia” a los taints.

Se puede omitir la llave _Value_ cuando está presente el operador _Exist:_

`tolerations: - key: "example-key" operator: "Exists" effect: "NoSchedule`

* Al utilizar una _Key_ vacía -con valor {}- y el operator _Exists_, implica que tolera todo tipo de _Taints_.

* Utilizar el campo _effect_ vacío -con valor {}- intenta utilizar el efecto de la primer _Key_.

##### Node Selectors

Se pueden tagear los nodos con _labels_ utilizando el comando:

`kubectl label node <nodo> label:value`

De esta forma, se pueden “clasificar” los nodos para que un pod pueda valrse de dicha clasificación y preferir cierto tipo de nodo.

Sobre el pod se aplica un selector de labels de nodos (sobre spec):

`nodeSelector: label: value`

Si un pod se está ejecutando cuando se modifica un _label_ sobre el nodo y este no coincide con el esperado por su _selector_, se desaloja del nodo.

La gran limitación que ofrece esta función es que no pueden buscarse nodos que cumplan dos diferentes labels a la par, sino solo aquellos que cumplan las dos labels (ejemplo: Size medium, size large, not size small). Para ello, usar Affinity.

Otra forma algo primitiva de asignar un pod a un nodo es utilizar la propiedad _nodeName_ y el nombre de un nodo en su sección _spec_.

#####

Node Affinity and Anti-Affinity

Permite hacer selecciones complejas de nodos, para aquellos pods que requieren cierto tipo de nodo específico y que la función de Node Selector no alcanza a identificar (múltiples requisitos).

Se agrega en la sección _spec_ del pod:

`affinity: nodeAffinity: requiredDuringSchedulingIgnoreDuringExecution: nodeSelectorTerms: - matchExpressions: -key: operator: value:`

Es posible definir un tipo de Node Affinity más leve, que es _preferredDuringSchedulingIngoreDuringExecution_, para que se cree de todas formas el pod si no se cumple la regla en ningún nodo.

Se pueden utilizar los operadores _In/NotIn_ y _Exists/DoesNotExists_ (no llevan el campo _value_).

#####

Combinación de Node Affinity y Taints/Tolerations

Como ambos tienen de por sí algunos casos de “escape” o excepciones donde no alcanzan a asegurar que los pods correctos -y solo esos- se asignaran a ciertos nodos, pueden combinarse para asegurar al 100% la asignación.

Despues de todo, Tains/Tolerations definen los nodos que “no tolera” un pod y Node Affinity aquellos que prefiere un Pod, cubriendo el 100% de los casos.

#### Resources and Requests

##### Equivalencias de unidades

**\-CPU:** 1 cpu == 1000m (milicores) = 1 vcpu +-

**\-Memoria:**

* Escala “Clasica”: 1 Kb (Kilobyte) = 1024 bytes

* Escala “Kilo”: 1 Ki (Kibibyte) = 1000 bytes

##### Acciones de límites

**\-CPU:** _Throttle_ al llegar al límite.

**\-Memoria:** Terminar el pod.

##### Valores por defecto

Estos solo existen si se crea un LimitRange sobre el namespace:

`apiVersion: v1 kind: LimitRange metadata: name: resources-limit-range spec: limits: - default: memory: 512Mi cpu: 1 defaultRequest: memory: 256Mi cpu: 0.5 type: Container`

#### Variables de entorno

Se puede enviar información montada como _variables de entorno_ hacia un container de un pod.

Las _Enviroment Variables_ se cargan al inicio del _Pod_, por lo que es necesario reiniciarlo (eliminarlo y crear uno nuevo) para que tome un cambio.

Uso normal:

`env: - name: <nombre> value: <valor>`

Uso con un provider (_ConfigMap_ o _Secret_):

`env: - name: <nombre> valueFrom: configMapKeyRef: name: <nombreDeCM> key: <llaveAInsertar>`

Uso con un provider como lista (array):

`envFrom: - configMapRef: name: <nombreDeCM`

Importante: Cambia el término _configMapKeyRef_ por _configMapRef_, ya que se monta todo el archivo y no solo una llave dentro del mismo.

### Node

Virtual Machine que actua como worker dentro de un cluster. Luego el _kubelet_ es el agente que administra el nodo y se comunica con el _Control Plane_ del cluster. Además, debe de contener alguna herramienta para el manejo de contenedores -o continer runtime-, como _containerd_ o _docker_ (ya no soportado).

#### Node-Components

#### Kubelet

Agente instalado sobre los nodos que efectua las tareas que le envía el _Kube-APIServer_, en base a los tiempos del _Scheduler_. El _kubelet_ se encarga de manejar el _Container Runtime Engine_ del nodo para crear containers y pods.

##### Kube-Proxy

Realiza tareas de networking a bajo nivel sobre los nodos, reflejando los servicios localmente y admitiendo forwardeo _TCP/UDP_; obtiene las IPs del cluster mediante _DNS_ o _variables de entorno_.

En el caso de los _services_, les provee una _IPTable_ para redirigir el tráfico hacia un pod, cuando corresponda.

#### Static Pods

El Kubelet trabaja a nivel pod, por lo que -sin el apoyo del _Master_ y todos sus controladores- podría únicamente generar pods; esto lo puede hacer sin necesidad de estar en un clúster, pero no puede crear otro tipo de recursos de _K8s_.

A los pods creados por un nodo mediante un mainifiesto local (sobre el host) se les llama _Static Pods_ y es una gran herramienta para desplegar componentes del sistema sobre el _ControlPlane_ (aplicar _Kubernetes_ a _Kubernetes_). De esta forma, es posible crear un _Master_ con solo instalar el _Kubelet_ y el resto de los componentes como _Static_ _Pods_ (táctica aplicada por la herramienta _KubeAdm_).

La dirección _IP_ de un _Static Pod_ es la misma que la del nodo.

Los manifiestos sobre el nodo se guardan en una ubicación fija, la cual está definida por el parámetro _\--pod-manifest-path_, o bien el parámetro _StaticPodPath_ dentro del archivo _\--config_ (_YAML_) con el que se inicia el _Kubelet_.

Para ver ruta en linux, ejecutar:

`#Mostrar procesos linux, filtrar por Kubelet y filtrar por config ps -aux | grep kubelet | grep config #Buscar en la ruta del config el staticPodPath por Regex cat <rutaConfig>/config.yaml | grep -i ^static #Tomar nota de la ruta`

Si se crean Static Pods en un clúster con Kube-APIServer, este los puede visualizar, pero solo muestra un objeto espejo de ellos, en modo read-only.

Para identificarlos y distinguirlos de un pod normal, notese que se agrega el sufijo “NombreDeNodo” al nombre del pod.

### Replica Set

Objeto que asegura que se cumple la cantidad de réplicas de pod definida esté activa y saludable. Tiene la potestad de agregar pods según necesite, o también quitarlos. Utiliza un template para la creación de Pods, que básicamente lleva la configuración que llevaría un manifiesto del pod (su metadata y specs).

A diferencia de los prácticamente deprecados _Replication Controllers_ (que trabajaban por nombre), estos objetos identifican pods dentro del grupo de trabajo, basados en una selección de set . Para ello, el ReplicaSet utiliza un _selector_ que identifica los pods por _labels_ (por lo que puede también manejar pods que no se crearon con el template del RS en sí); este selector debe estar definido en la sección metadata.labels del pod.

Atención: Utilizar “kubectl scale” no se edita el RS o RC, por lo que no es la forma recomendada de escalar una solución.

Ejemplo de manifiesto para un _RS_:

`apiVersion: apps/v1 kind: ReplicaSet metadata: name: nombre labels: <ReplicaSetLabel1> : <ReplicaSetValor1> spec: templates: metadata: <PodLabel1> : <PodValor1> spec: - name: image: replicas: cantidad selector: matchLabels: <PodLabel1> : <PodValor1>`

Nótese que los _labels_ del _RS_ no son los mismos que los del pod, además de que estos últimos deben estar indicados en el _selector_.

### Deployment

Manifiesto que indica a Kubernetes cómo actualizar y desplegar una aplicación contenerizada. Luego el _Deployment Controller_ monitorea continuamente el estado de esa aplicación. Es un recurso muy similar a un ReplicaSet, y de hecho utiliza un ReplicaSet al crearse, pero le agrega a este funcionalidades extra como el de actualizar la aplicación o hacer un rollout.

Ejemplo de manifiesto:

`apiVersion: apps/v1 kind: Deployment metadata: blabla spec: templates: metadata: <PodLabel1> : <PodValor1> spec: - name: image: replicas: cantidad selector: matchLabels: <PodLabel1> : <PodValor1>`

Nótese la similitud respecto del manifiesto de un _ReplicaSet_, además de que se utiliza el mismo sistema de _selector_ para identificar los pods.

#### Tipos de despliegue

Un cambio en el _Deployment_ implica dispara una acción _rollout_, donde se actualizan todos los _pods_ para cumplir con el nuevo _template_. Existen diferentes estrategias para lograr esta actualización:

##### Rolling Update

Se crea un nuevo _ReplicaSet_ en paralelo al existente, el cual incorpora réplicas de pods con el template nuevo, a medida que decomisa réplicas con el template viejo. Para evitar downtime durante este proceso, Kubernetes no quita una instancia de pod vieja hasta no disponer de una instancia nueva respondiendo correctamente.

El campo _strategyType_ del deployment indica el tipo utilizado en esa instancia. Además, existen campos como _MaxSurge_ que personalizan la agresividad del despliegue.

##### Recreate

Se quitan las versiones viejas y se despliegan las nuevas, todo en simultáneo. Demás esta decir que esta opción no es recomendada.

### Service

_Balanceador de carga_ para los pods que actua de forma virtual y corre sobre la memoria del clúster; forwardea el tráfico recibido hacia los pods que cumplen ciertos requisitos de tagging (_label selectors_).

Para poder almacenar las IPs de los pods de destino, utiliza un objeto llamado _Endpoint_ que tiene una serie de records con las IPs de todos los pods que cumplen con el _selector_. En ocasiones especiales estos pueden administrarse manualmente.

#### Tipos de servicio

##### LoadBalancer

Modo compatible con proveedores cloud que hace un balanceo de carga entre los NodePorts de todos los nodos donde el servicio expone trafico.

##### NodePort

Expone el servicio en un puerto del/los nodos. Esta opción no es viable para un clúster autoescalable o con nodos genéricos.

##### ClusterIp

Expone una IP de servicio y redirige el tráfico al backend.

##### Headless (acéfalo)

Servicio sin una IP frontal, para aquellos pods que no requieren balanceo. En cambio se arma una lista de records DNS tipo “A” para los pods que cumplan con el _Selector_ y es gracias a eso que los pods son accesibles por otros servicios mediante consulta DNS. Alternativamente puede no utilizarse un selector y crearse un _Endpoint_ manualmente.

#### Especificaciones

\-Un servicio tiene su propia IP, a la cual se llama clusterIP.

\-Los servicios operan en _capa 3_ (TCP/UDP).

\-Los puertos que puede usar de un nodo son entre 30000 y 32767.

\-Utilizar “clusterIp” define la IP manualmente (además del tipo de SVC).

Si no se provee un puerto de servicio, se utiliza el mismo que el _TargetPort_. Si no se provee un NodePort, se asigna uno al azar del rango permitido.

Utilizar “kubectl expose deployment <deployment>” permite crear un servicio directamente.

Ejemplo de manifiesto:

`apiVersion: v1 kind: Service metadata: name: nombre spec: type: Tipo ports: - selector: app: miapp`

### DaemonSet

Tipo de controlador que asegura que exista una copia del pod en cada nodo del clúster. Sirve para herramientas de monitoreo y networking que necesitan conectar con o saber el estado de los nodos.

La definición del manifiesto es ídentica a la de un ReplicaSet, pero con Kind “DaemonSet” (lleva un pod template y selectores, sin el campo replicas).

Utiliza _nodeAffinity_ para ubicar los pods.

No existe kubectl create daemonset, por lo que se utiliza kubectl create _ReplicaSet_ o _Deployment_  como template y luego se editan los campos necesarios.

El _scheduler_ no administra los pods de un _DS_, sino que lo hace el mismo _Daemonset_, lo cual es modificable en la configuración. En caso de modificarlo, el _scheduler_ administra el _DS_ y le cambia el _NodeAffinity_ que trae, para coincidir con la confiugración de despliegues pod>nodo que necesita.

En caso de utilizar `--cascade=orphan` al eliminar un _Daemonset_, al desplegar otro con el mismo _Selector_, este adopta los _pods_ que quedaron huérfanos. Luego -si fuera necesario- adecua los pods que no cumplan con el template, recreandolos.

### StatefulSet

Tipo de objeto similar a un _Replica Set_, que permite que cierta cantidad de pods siempre esté disponible, pero además tenga las siguientes características:

* DNS Hostname fijo

* Índice ordinal

* Almacenamiento estable, relacionado con esos hostname e índice

Es una alternativa para aquellas aplicaciones que son _stateful_ y requieren de cierta persistencia a pesar de que los pods roten (se eliminen y recreen). Para obtener esa permanencia, los pods reciben un nombre particular y ordenado, además de exponerse con un servicio _Headless_ que debe crearse manualmente. El almacenamiento también es único y asociado a cada pod vía nombre, además de utilizar un _VolumeClaimTemplate_ para crearlo (asumiendo que el clúster cuenta con _Provisionamiento dinámico de volúmenes_).

El borrado de un _Statefulset_ no implica el borrado de los _PersistentVolumes_ asociados -para conservar datos- y -en ocasiones- puede no asegurar el borrado de los pods (para ello, escalar el _SS_ a 0 y luego eliminar).

### ConfigMap

Objeto que carga datos de aplicación como pares de valores _clave:valor_ y es útil para inyectar valores a los _containers_ de forma dinámica (actualizando únicamente el _ConfigMap_).

Se pueden montar como _Enviroment Variables_ (Env) o como _volúmenes_.

Al montar como volumen, se crea un archivo por llave y el contenido del archivo es el valor de cada llave.

Ejemplo de manifiesto:

`apiVersion: v1 kind: ConfigMap metadata: name: <nombre> data: llave1: valor1 llave2: valor2`

### Secreto

Objetos pequeños que almacenan información sensible en texto plano, pero codificados en base 64. Por defecto se almacenan sobre _etcd_ sobre los nodos y pueden montarse como archivos en los pods, que los mantendran sobre memoria (usualmente) para más seguridad.

Se pueden montar igual que los _ConfigMaps_, como _Env_ o como _volúmenes_.

Al montar como volumen, se crea un archivo por llave y el contenido del archivo es el valor de cada llave.

#### Niveles de seguridad

Los secretos no son exactamente seguros, ya que se codifican en base 64 y son facilmente decodificables. Aún así, Kubernetes aplica estrategias de protección:

* El Secreto existe en un nodo, solo durante la vida util del pod que lo invoca.

* El secreto se monta sobre tmpfs y no se escribe en disco (al montar como volumen)

Notas de color:

* Cualquiera con permisos GET de secretos puede leer el contenido (y decodificarlo).

* Dentro del pod el secreto no está ofuscado, por lo que cualquiera con acceso al pod puede obtener el valor del secreto.

Se recomienda activar Encryption at rest para ETCD, asegurando que nadie puede leer el contenido de los mismos si se vulera ETCD.

Ejemplo de manifiesto:

`apiVersion: v1 kind: Secret metadata: name: <nombre> data: llave1: <valorEncodeadoEnBase64>`

#### Codificar/decodificar en Base 64

Sobre Linux se puede utilizar base64 para codificar/decodificar:

`echo -n <string> | base64`

![:mag:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f50d.png) Observabilidad
=======================================================================================================================================================

Monitoreo
---------

No existen soluciones nativas de monitoreo en Kubernetes. Las herramientas de 3ros mas comunes son:

\-Metrics servers

\-Prometheus

#### Metric Server (Ex Heapster)

El componente “cadvisor” (Container advisor) le expone métricas al Kubelet de cada nodo, que luego lo consume el Metric Server.

##### Comandos

\-Metricas de nodos: `k top node`

\-Metricas de pods: `k top pods`

Open

Logging
-------

Los logs que muestra _Kubernetes_ son los que se emiten desde los containers en los streams de STDOUT y STDERR.

Como los _nodos_ son quienes alojan los pods -y estos los contianers-, es en su almacenamiento local que se guardan los logs, usualmente en el path “_/host/var/log/containers/<NombreCointaner>.log_

Usualmente se despliegan herramientas de logging como _Daemonset_, donde un pod por nodo se encarga de recolectar esos logs, parsearlos y enviarlos a una solución de logging general (no necesariamente externa a K8s).

![:hammer:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f528.png) Mantenimiento del clúster
=====================================================================================================================================================================

Mantenimiento de nodos
----------------------

Cuando un nodo se encuentra _offline_ inicia un conteo llamado _pod-eviction-timeout_, que por defecto es de 5 minutos. Luego de ese tiempo, el _Master_ considera a los pods _terminated_ y -por más que el nodo vuelva a estar operativo- los saca de ese nodo.

### Operaciones

#### Drain

Terminar los pods asignados al nodo y re-asignarlos a otros. Además, marca al nodo con _cordon_ (no disponible para recibir cargas de trabajo) y luego debe ser marcado como _uncordoned_ para que vuelva a recibir pods.

`kubectl drain <nodo> --ignore-daemonsets`

Los pods que no son parte de un _replicaset_ pueden generar problemas y debe agregarse `--force`, ya que los mismos pierden disponibilidad al ser _evicted_ y no se crean automáticamente en otros nodos.

#### Cordon

Marcar como _unschedulable_ (no disponible para recibir cargas de trabajo) a un nodo, para que no se le puedan asignar más pods. Luego debe marcarse como _uncordoned_ para que vuelva a recibir pods.

`kubectl cordon <nodo>`

`kubectl uncordon <nodo>`

![:cd:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4bf.png) Actualización del clúster
=================================================================================================================================================================

Versionado de Kubernetes
------------------------

El formato de las versiones de Kubernetes es el siguiente:

v <major>.<minor>.<patch>

Ejemplo: v1.11.3 corresponde a la versión major 1, minor 11 y parche 3.

Los _minor releases_ traen nuevas funciones y características; los parches arreglan bugs.

Primera versión: 1.0 en Julio de 2015.

Además, las versiones pasan de Alpha a Beta y luego a un release (Alpha>Beta>Release).

Planeamiento previo
-------------------

El contenido de un release incluye: _kube-apiserver, kube-controller-manager, kube-scheduler, kubelet, kube-proxy y kubectl_ (componentes principales).

Luego ETCD cluster, CoreDNS y otros componentes de sistema se actualizan aparte y no comparten el versionado.

El _Kube-APIServer_ es el que debe tener la versión mayor, ya que todos los componentes se comunican con dicho componente. Luego pueden existir diferencias de _release-version_ hacia atrás:

\-1 versión menos: _Kube-Controller-Manager_ y _Kube-Scheduler_ (_cluster-wide components_)

\-2 versiones menos: _Kubelet_ y _Kube-Proxy (node-side_ components)

Solo _Kubectl_ puede tener una versión mayor (o menor) que _Kube-APIServer_, porque eso permite hacer live-upgrades del cluster.

El soporte de Kubernetes incluye un rango de las últimas 3 versiones, incluida la actual.

Cómo actualizar
---------------

Las actualizaciones se hacen de a un _minor_ release a la vez.

Se actualiza primero el _Master_ y luego los _worker Nodes_. Por ende, por unos minutos las funcionalidades de management no estarán activas (dependen del master) , pero si las cargas de trabajo seguiran vivas. Luego, idealmente se deben actualizar los nodos de _forma escalonada_, aunque se pueden hacer todos en paralelo (con downtime):

1. Actualizar _Master/s_ o _Control Plane_/s

2. Actualizar _Nodes_ de forma escalonada, con estrategias:

    1. Actualizar _Nodos_ uno a uno.

    2. Reemplazar _Nodos_ uno a uno, con nuevos nodos que tengan una imagen nueva.

En todos los casos, la actualización de un nodo implica la alteración de las cargas de trabajo, por lo que deben desalojarse con operaciones _drain_ y _cordon_.

### Actualizar con Kubeadm

#### Vista previa

En lineas generales, el flujo de upgrade implica:

1. Sobre el _Master_:

    1. Actualización de Kubeadm

    2. Plan de upgrade

    3. Aplicacion de Upgrade

    4. Actualización de _Kubectl_ y _Kubelet_

    5. Reinicio de _Kubelet_

2. Sobre los _Nodes_:

    1. Aplicación de Upgrade

    2. Actualización de _Kubelet_ y _Kubectl_

    3. Reinicio de _Kubelet_

Nótese que no actualiza los _Kubelet_ o _Kubectl_ de los nodos, sino que es una tarea manual. Por ende, es normal luego de un upgrade con _Kubeadm_ ver una versión “anterior” al ejecutar el comando `kubectl get nodes`, ya que eso muestra la versión del _Kubelet_, no alcanzado por el upgrade.

Si los _Master Nodes_ tuvieran _Kubelet_ y alojaran cargas de trabajo, debe aplicarse además la estrategia de upgrade de los _worker Nodes_ luego de actualizar.

Seguir guia de:

[https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)  

#### Comandos

**Master Node/Control Plane**

`#Actualizar Kubeadm apt-mark unhold kubeadm kubelet kubectl apt-get update apt install -y kubeadm=1.xx.x-00 #Planear upgrade kubeadm upgrade plan #Aplicar upgrade con Kubeadm: kubeadm upgrade apply v1.xx.x #Actualizar Kubectl y Kubelet (si aloja workloads) apt install -y kubelet=1.xx.x-00 kubectl=1.xx.x-00 apt-mark hold kubeadm kubelet kubectl #Reiniciar Kubelet (si aloja workloads) systemctl daemon-reload systemctl restart kubelet systemctl status kubelet`

**Worker Node**

`#Desalojar cargas de trabajo del nodo: kubectl drain <nodo> #Obtener updates y aplicar upgrades sobre Kubeadm apt-mark unhold kubeadm kubelet kubectl apt-get update apt install -y kubeadm=1.xx.x-00 #Aplicar upgrade kubeadm upgrade node #Actualizar Kubectl y Kubelet apt install -y kubelet=1.xx.x-00 kubectl=1.xx.x-00 apt-mark hold kubeadm kubelet kubectl #Reiniciar Kubelet systemctl daemon-reload systemctl restart kubelet systemctl status kubelet #Activar nodo para cargas de trabajo: kubectl uncordon <nodo>`

Notese la diferencia en el comando `Kubeadm Upgrade`, que en los nodos Workers no aclara versión, ya que se utiliza la del master.

![:floppy_disk:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4be.png) Respaldo/Backup del clúser
===========================================================================================================================================================================

Respaldo de Manifiestos
-----------------------

Forma rudimentaria de “extraer” todo el contenido de un cluster:

`kubectl get all --all-namespaces -o yaml > archivo.yaml`

Esto es lo que hace la herramienta de respaldo _Velero_ (ex _Heptio Ark_).

Además, mantener un repositorio _GIT_ con _manifiestos_ es la mejor forma de tener un respaldo a la última version de los objetos desplegados en _K8s._

Respaldo de ETCD
----------------

`#Version de ETCDCTL API export ETCDCTL_API=3 #Respaldo. No omitir parámetros de certificados, configuraciones, etc. etcdctl snapshot save ./snapshot.db --endpoints https://127.0.0.1:2379 --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key --cacert /etc/kubernetes/pki/etcd/ca.crt #Para validar el estado del snapshot, utilizar etcdctl snapshot status ./snapshot.db --write-out=json --endpoints https://127.0.0.1:2379 --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key --cacert /etc/kubernetes/pki/etcd/ca.crt #Restaurar. Esto inicia una configuración de clúster ETCD nueva con ese path. systemctl stop kube-apiserver systemctl stop etcd etcdctl snapshot restore ./snapshot.db --data-dir /var/lib/etcd-from-bkp  systemctl daemon-reload systemctl start kube-apiserver systemctl start etcd`

Si _ETCD_ corre como _static pod_, debe actualizarse el YAML de configuración para que apunte el nuevo path y forzarse reinicio de _Kubelet_ en el nodo para que actualice.

[https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)

![:key:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f511.png) Seguridad
==================================================================================================================================================

Nodos
-----

Idealmente deberían tener:

* Acceso root deshabilitado

* Password-based authentication deshabilitada

* Acceso mediante SSH Keys

Comunicación entre componentes
------------------------------

Debe utilizar _encripción TLS_ punta a punta, con certificados aprobados por un _Certification Authority_ (_CA_).

En general, el _CA_ es el _Master Node_, que luego debe aprobar los _CertificateSigningRequests_ de los diferentes componentes, para que cada uno tenga sus pares de certificados válidos.

Mecanismos de seguridad en un clúster
-------------------------------------

### Autenticación/Authentication

_**¿Quién puede acceder?**_

\-Público: Usuarios administrativos (Administradores y Developers) y aplicaciones/servers (Service Accounts).

El componente que autentica es el _Kube-APIServer_, utilizando una de estas opciones:

* **Static Password File:** CSV con columnas “pwd,usuario,userid,grupos” enviado como parámetro `--basic-auth-file` al encender el servicio _Kube-APIServer_.

* **Static Token File:** Igual que el anterior, un CSV pero con Tokens en lugar de passwords, enviado como parámetro `--token-auth-file` al encender el servicio _Kube-APIServer_.

* **Certificates:** Certificados _TLS_.

* **Identity Services externos**: Integración con algún servicio externo.

De más está decir que los métodos de archivos estáticos no son recomendados por cuestiones de seguridad y administrabilidad.

Deben acompañarse los usuarios con Roles y Role Bindings necesarios.

* Para un llamado API con autenticación básica, se agrega el parámetro `-u <user>:<password>.`

* Para un llamado API con autenticación básica de token, se agrega el parámetro `--header "Authorization: Bearer <token>"`.

### Autorización/Authorization

_**¿Qué puede hacer?**_

La autorización es el mecanismo de seguridad que -luego de la autenticación- indica qué tareas puede realizar o a qué recursos puede acceder un _usuario_ o _identidad_; los _roles_ definen una serie de permisos sobre operaciones que se pueden realizar en diferentes _API Groups_ (grupos _API_ que engloban operaciones con ciertos tipos de recursos). Luego las asociaciones de roles (_Role Bindings_) asignan un rol a un usuario/grupo.

#### Mecanismos de autorización

\-**AlwaysAllow** (Default): Aprueba todos los requests.

\-**AlwaysDeny**: Deniega todos los requests.

\-**Node Authorizer**: Solo autoriza nodos, mediante el grupo `system:nodes`.

\-**ABAC** (Attribute-Based Access Control).

\-**RBAC** (Role-Based Access Control).

\-**Webhook**: Integración y delegación de autorizaciones a un servicio externo, mediante Webhook HTTP.

El parámetro `--authorization-mode` enviado al iniciar el `Kube-APIServer` indica el/los mecanismos de autorización a utilizar en el clúster. Pueden además utilizarse de forma combinada, especificandolos separados por coma en el parámetro `--authorization-mode`. De esta forma, corren en el orden indicado en la lista, y se van pasando el request (solo en caso de denegarlo).

#### ABAP

Se asocia un grupo (o grupo de usuarios) a un permiso específico, sucesivamente hasta cubrir todas las operaciones que se aprueban para el usuario. Luego cada usuario tiene su grupo de entradas, las cuales se incrementan cuando se incrementa la cantidad de usuarios.

Agregar una línea implica reiniciar el Kube-APIServer. Por ende, este método no es recomendado para un clúster de gran escala, ya que es dificil de administrar.

Ejemplo de permiso (cualquier operación, sobre cualquier recurso):

`{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "alice", "namespace": "*", "resource": "*", "apiGroup": "*"}}`

#### RBAC

Implica la definición de roles con cierta cantidad de permisos asociados y luego asignar dichos roles a un usuario/grupo de usuarios. De esta forma, el cambio -al incrementar o agregar permisos- ocurre sobre el rol y aplica para todos los usuarios que lo tienen (ahorrando operaciones sobre cada usuario).

Los roles tienen dos alcances:

* **Cluster**: Tanto para aquellos recursos que **no** son _Namespaced (Cluster-Wide)_ como para aquellos que **si** son _Namespaced_. Estos permisos se crean con roles llamados _ClusterRole_ y afectan a nivel clúster.

* **Namespace**: Para aquellos recursos que **si** son _Namespaced_. Se crean con roles llamados _Roles_ y afectan a nivel namespace.

Los permisos son aditivos y no existen reglas de denegación. Por ende, es importante definir el rol completo, o el usuario solo tendrá acceso a aquellos recursos que el mismo defina.

Los roles se pueden definir a nivel namespace, utilizando _metadata.namespace_ y hacer efecto solo en ese NS.

##### Comandos

Obtener roles:

`kubectl get roles`

Obtener asignaciones de roles:

`kubectl get rolebindings`

Crear un rol o clusterRole:

`kubectl create cluster/role <Nombre> --verb=<Verbo1>,<Verbo2> --resource=<RecursoOAPIGroup>`

Crear un rolBinding o ClusterRoleBinding (asociar un rol) a un usuario:

`kubectl create cluster/rolebinding <Nombre> cluster/role=<NombreRol> --serviceaccount=<Namespace>:<Nombre>`

Crear un rolBinding o ClusterRoleBinding (asociar un rol) a una ServiceAccount:

`kubectl create cluster/rolebinding <Nombre> cluster/role=<NombreRol> --user=<Username>`

Ver si el usuario actual tiene permisos para hacer una operación:

`kubectl auth can-i <verbo> <recurso>`

Ver si se puede hacer una operación pero como otro usuario:

`kubectl auth can-i <verbo> <recurso> --as <usuario>`

Para ver si un _ServiceAccount_ puede hacer una operación:

`kubectl auth can-i <verbo> <recurso> --as system:serviceaccount:<Namespace>:<Nombre>`

##### Role definition

Define las tareas que puede realizar un rol.

`apiVersion: rbac.authorization.k8s.io/v1 kind: Role metadata:  name: developer rules:  - apiGroups: [""]    resources: ["pods"]    verbs: ["list","get","create","update","delete"]     #Opcional para restringir por recurso especifico     #resourceNames: [“pod1”,”pod2”]  - apiGroups: [""]    resources: ["ConfigMap"]    verbs: ["create"]`

Para objetos del grupo “Core”, no hace falta definir el APIGroup (usar “”).

Ejemplo de permiso “Any-Any” o Cero-Restrictivo (acceso a todo en el Namespace):

`apiVersion: rbac.authorization.k8s.io/v1 kind: Role metadata:  name: developer rules:  - apiGroups: [“*”]    resources: [“*”]    verbs: [“*”]`

##### Role binding

Asocia un rol a un usuario o identidad (puede ser un grupo).

`apiVersion: rbac.authorization.k8s.io/v1 kind: RoleBinding metadata:  name: devuser-developer-binding subjects:  - kind: User    name: dev-user    apiGroup: rbac.authorization.k8s.io roleRef:  kind: Role  name: developer  apiGroup: rbac.authorization.k8s.io`

Nótese que los APIGroups no tienen el V1 y que el campo _roleRef_ **no** es un _Array_.

##### ClusterRole

Por defecto, aplica sobre recuros _ClusterScope_ (globales). En caso de asociar un ClusterRole a un recurso Namespaced, eso otorga el mismo rol sobre todos los namespaces.

El recurso _ClusterRole_ en sí no es parte de ningún _Namespace_, al igual que un _nodo_, por ser recursos _ClusterScope_ o _ClusterWide_.

`apiVersion: rbac.authorization.k8s.io/v1 kind: ClusterRole metadata:  name: developer rules:  - apiGroups: [""]    resources: ["nodes"]    verbs: ["list","get","create","update","delete"]     #Opcional para definir sobre un recurso especifico     #resourceNames: [“nodo1”]`

##### Cluster Role binding

Asocia un _ClusterRole_ a un usuario.

`apiVersion: rbac.authorization.k8s.io/v1 kind: ClusterRoleBinding metadata:  name: devuser-developer-binding subjects:  - kind: User    name: dev-user    apiGroup: rbac.authorization.k8s.io roleRef:  kind: ClusterRole  name: developer  apiGroup: rbac.authorization.k8s.io`

### Service Account

Es una cuenta utilizada por servicios o software. No lleva clave, sino que utiliza un _Bearer Token_, cuyo valor se almacena como _secreto_ y se asocia al objeto _ServiceAccount_.

Para utilizarlo, en general se monta como volumen en el _pod_, para disponibilizar el _token_ dentro del mismo. Cada _Namespace_ tiene un _ServiceAccount_ llamado “Default”. Estos se montan de forma automática en el Pod, sobre /var/run/secrets/kubernetes.io (donde también reside el CA.cert).

No se ven en el _deployment_ si es el _token_ montado por defecto, a no ser que se especifique con el campo _serviceAccount_.

La propiedad _automountServiceAccountToken_ permite desactivar esta funcionalidad, con el valor “false”.

El formato de las cuentas es `"system:<TipoDeCuenta>:<Namespace>:<Cuenta>"`.

#### Comandos

Crear _ServiceAccount_:

`kubectl create serviceaccount <nombre>`

Comunicarse con API mediante uso de cuenta:

`curl https://localhost:6443/api -insecure --header "Authorization: Bearer <ValorDeToken>"`

Complementario: Certificados TLS
--------------------------------

Un certificado es utilizado para asegurar una conexión cifrada de confianza entre dos servidores. Para descifrar los datos encriptados, es necesaria una llave (usualmente como representada como _Certificado_).

### Encripción simétrica

Utiliza la misma llave para encriptar/desencriptar los datos, por lo cual es vulnerable (la llave debe viajar de forma pública y puede ser interceptada).

Open

### Encripción asimétrica

Se utilizan dos llaves, una _privada_ y una _pública_ -o _lock_\-.

La _llave pública_ solo sirve para _cifrar_ el contenido, no _descifrarlo_.

Ambas llaves pueden encriptar datos, pero solo la _privada_ desencriptarlo, por lo cual es importante nunca encriptar con la clave privada, ya que eso permitiría desencriptar con la clave pública (invertir los roles).

Usualmente las llaves públicas tienen extensión _CRT_ o _PEM_, mientras que las privadas tienen extensión _KEY_ (o _PEM_ con el sufijo _\-key_ en el nombre). Son archivos de texto plano que dentro tienen el contenido del certificado encriptado.

Open

#### Llaves SSH en Linux

Se utiliza `ssh-keygen` para generar par de llaves y luego ubicarlas en _/.ssh/authorized\_keys_.

#### Llaves para HTTP

Se utiliza `openssl genrsa -out clave.key 1024` para generar la llave _privada_ y _o_`penssl rsa -in clave.key -pubout > lock.pem` para generar clave _pública_ (o _lock_).

### Combinación de encripción simétrica y asimétrica

Se envía una copia de la llave _pública_ **asimétrica** al cliente -quien solo puede encriptar información con ella\- y este la utiliza para encriptar la llave _privada_ **simétrica**. Luego el servidor recibe ese paquete encriptado, lo desencripta con la llave _privada_ **asimétrica** (única llave que puede desencriptarlo) y así puede recibir/visualizar el contenido de la llave _privada_ **simétrica**. Luego comienzan a enviar datos encriptados simétricamente, que solo pueden ser desencriptados por la llave privada simétrica, pero que solo tienen ellos en su poder y no hace falta enviar vía internet.

La clave pública se envía como certificado.

Resumen de flujo:

1. El servidor envía llave pública asimetrica

2. El cliente encripta su llave privada simétrica con la llave pública asimétrica

3. El servidor recibe el paquete encriptado y lo desencripta con la llave privada asimétrica

4. Se establece un canal de conexión seguro por encripción simétrica, donde la llave privada simétrica solo vive en los extremos cliente y servidor

En definitiva, se utiliza el método _asimétrico_ de encripción para poder intercambiar claves y luego poder adoptar el método _simétrico_ de encripción.

### Uso de certificados - Public Key Infrastructure (PKI)

Un _certificado TLS_ se utiliza para enviar dentro una _llave pública_, pero acompañarla con información relevante sobre la misma, su portador, su emisor (o firmante) y el nombre del sitio -CN- (o URL).

#### Autoridad certificante (Certification Authority)

Si el dominio del sitio no coincide con el declarado en el certificado, puede implicar un intento de phishing; si el firmante no es de confianza, puede implicar un intento de hackeo. Por ende, se recurre a un firmante/emisor (signer o issuer) que tenga autoridad, lo cual se llama _Certficitation Authority_ (_CA_), que introduce los _Root certificates_ (o certificados raiz).

Para obtener un certificado firmado para una llave pública, se crea un _Certificate Signing Request_ (o _CSR_) para esa llave y dominio, luego se envía al _firmante_ quien valida la información y envía el certificado firmado (que goza de _Trust_ (o confianza) por la validez del firmante.

Luego, para certificar esta confianza, los _CA_ utilizan un par de llaves asimétricas, donde la clave pública la carga el navegador y la clave privada la utiliza el _CA_ para firmar un certificado.

Para uso interno en una compañia, se puede crear un _CA privado_, luego instalar la llave pública en todos los browsers de los empleados y firmar certificados con la llave privada de dicho CA, para garantizar validez.

También puede exigirse un certificado de cliente, para que el server valide confianza con el mismo, lo cual se hace también con un CSR a un trusted CA, luego enviando la info. al servidor.

### Uso en Kubernetes

Todos los componentes _cliente_ tienen su propio par de llaves privada/pública y los usan para comunicarse con los servicios de tipo _server_, que aseguran esos servicios con otro par de llaves propio. Luego debe existir un _CA_ para todos esos certificados, con el que todos establezcan confianza (deben tener instalado el cert. público del CA).

#### Comandos TLS para Linux

##### Generar certificado autofirmado para CA

`#Generar llave privada openssl genrsa -out <llave>.key 2048 #Generar CSR (Request) para esa llave openssl req -new -key <llave>.key -subj "/CN=<Nombre>" -out <Request>.csr #Firmar certificado (propio CA) openssl x509 -req -in <Request>.csr -signkey <llave>.key -out <Certificado>.crt`

La llave pública va en el certificado firmado.

##### Generar certificado para usuarios (Admins)

`#Generar llave privada openssl genrsa -out <llave>.key 2048 #Generar CSR (Request) para esa llave openssl req -new -key <llave>.key -subj "/CN=<Nombre>/O=system:<usuarios>" -out <Request>.csr #Firmar certificado (en el CA!) openssl x509 -req -in <Request>.csr -signkey <llaveCA>.key -out <Certificado>.crt`

##### Generar certificado para componentes del sistema

`#Generar llave privada openssl genrsa -out <llave>.key 2048 #Generar CSR (Request) para esa llave openssl req -new -key <llave>.key -subj "/CN=system:<Nombre>" -out <Request>.csr #Firmar certificado (en el CA!) openssl x509 -req -in <Request>.csr -signkey <llaveCA>.key -out <Certificado>.crt`

##### Ver detalles de un certificado

`openssl x509 -in <certificado>.crt -text -noout #O bien -solo para ver el certificado, pero encriptado- cat <certificado>.crt`

##### Ver detalles de un CertificateSigningRequest

`openssl req -text -noout -verify -in CSR.csr`

##### Llamado API con certificados

Usando un comando:

`curl https://kube-apiserver:6443/api/v1/pods --key admin.key --cert admin.crt --cacert ca.crt`

Usando kube-config:

`apiVersion: v1 kind: Config clusters:  - cluster:      certificate-authority: ca.crt server: https://kube-apiserver:6443 name: kubernetes users: - name: kubernetes-admin user:      client-certificate: admin.crt      client-key: admin.key`

### Certificado de Kube-APIServer

Debe incluir los nombres:

* kubernetes

* kubernetes.default

* kubernetes.default.svc

* kubernetes.default.svc.cluster.local

Para generarlo, primero armar un archivo de configuración de _OpenSSL_:

`[req] req_extensions = v3_req [ v3_req ] basicConstraints = CA:FALSE keyUsage = nonRepudiation,subjectAltName = @alt_names [alt_names] DNS.1=kubernetes DNS.2=kubernetes.default DNS.3=kubernetes.default.svc DNS.4=kubernetes.default.svc.cluster.local IP-1=10.96.0.1 IP-2=172.17.0.87`

Y luego crear request con ese archivo como parámetro:

`openssl req -new -key <llave>.key -subj "/CN=kube-apiserver" -out <request>.csr -config openssl.cnf`

Luego firmar con el _CA_ y especificarlo en la linea de inicio del _Kube-APIServer_ como parámetro.

##### Certificados de Nodos o Kubeletes

Son prácticamente _HTTP Servers_, por lo que llevan su propio par de llaves firmado por el _CA_. El _CN_ utilizado es el _hostname_ del nodo.

Luego se configuran esos certificados como parámetros en el _Kubelet_ config file. Además, para autenticar contra el _Kube-APIServer_, lleva un par de llaves de cliente, cuyos certificados llevan el _CN_ con sufijo `system:node:<nombrenodo>`, para categorizarlos y recibir los permisos correctos.

Los certificados en un clúster existente pueden identificarse en la línea de comandos que inicia el _Kube-APIServer_, que puede o no ser un _static pod_.

#### Estado de salud TLS de un clúster

Para chequear el estado de salud de un clúster y sus certificados:

1. Asegurarse de que los _CN_ y _ALT_ names son correctos para todas las emisiones de certificado.

2. Verificar que no hayan expirado los certificados

3. Verificar que el _CA_ firmante es el correcto

4. Verificar que el certificado _CA_ esté instalado en todos los servidores, para asegurar confianza

5. Verificar que la ruta de los archivos de certificado es la correcta

### Uso en ETCD

_ETCD_ opera como un clúster con un servidor central, por lo que tiene sus propios pares de llaves de servidor y de clientes (en este caso, los _peers_). Puede además tener su propio _CA_, o compartir el del _master_ de _Kubernetes_.

### Certificates API

_API_ de _Kubernetes_ que permite operar en nombre del _CA_ y ver/aprobar/firmar _requests_ (o listar certificados); está alojada dentro del Kube-_Controller-Manager_.

Los parámetros `--cluster-signing-cert-file` y `--cluster-signing-key-file` enviados al _Kube-Controller-Manager_ al iniciar indican qué par de claves utilizar para aprobar como _CA_.

Para solicitar un _CSR_, se crea un objeto de _K8s_ llamado _CertificateSigningRequest_:

`apiVersion: certificates.k8s.io/v1 kind: CertificateSigningRequest metadata: name: nombre spec: usages:        - digital signature        - key encipherment        - server auth clientAuthRequest: <Contenido de archivo CSR Codificado en Base64>   signerName: kubernetes.io/kube-apiserver-client`

#### Crear un usuario nuevo

Crear llave _privada_ y _CSR_:

`openssl genrsa -out myuser.key 2048 openssl req -new -key myuser.key -out myuser.csr`

Encodear en base 64 el _CSR_ y preparar archivo _YAML_:

`cat myuser.csr | base64 > myusercsr.yaml`

Armar manifiesto _YAML_ con ese _CSR_ codificado:

`apiVersion: certificates.k8s.io/v1 kind: CertificateSigningRequest metadata: name: myuser spec: request: <CSREncodeadoEnBase64> signerName: kubernetes.io/kube-apiserver-client usages: - client auth`

Aplicar el manifiesto con `kubectl apply -f myusercsr.yaml` y luego buscar con `kubectl get cs`r myusercsr.

Para aprobar, ejecutar `kubectl approve certificate myusercsr` y luego obtener el valor del certificado, decodificarlo en base 64 y guardarlo:

`kubectl get csr myusercsr -o jsonpath='{.status.certificate}' | base64 -d | myusr.crt`

Para asignarle un _rol_ no hace falta el _certificado_ en si, solo el nombre. En cambio para que el usuario se conecte, debe utilizar ambos _certificado_ y _llave privada_ en su _kubeconfig_ al conectarse al clúster.

[https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user)

#### Comandos de Certificates API

Ver _CSR_:

`kubectl get csr`
Aprobar _CSR_:

`kubectl certificate approve <nombre>`
Denegar _CSR_

`kubectl certificate deny <nombre>`

El certificado generado una vez aprobado el _CSR_ se puede ver en el _manifiesto_ propio del _CSR_ como _YAML_, sección _Status.certificate_ (codificado en base64).

### Configuración de Kubectl - Kubeconfig

Así como debe autorizarse un llamado _API_ al _Kube-APIServer_, deben autenticarse los comandos de _Kubectl_.

Si bien podrían especificarse los parámetros manualmente en cada comando, por ejemplo:

`kubectl get pods --server <servidor> --client-key <llave> --client-certificate <cert> --certificate-authority <CACert>`

Esto sería algo tedioso, por lo que se utiliza un archivo denominado _Kubeconfig_, que contiene esos parámetros:

`--server <servidor> --client-key <llave> --client-certificate <cert> --certificate-authority <CACert>`

#### Ubicación del archivo

Por defecto, _Kubectl_ espera este archivo ubicado en _$HOME/.kube/config_ (_%homepath%\\.kube\\config_ en Windows).

En Linux los directorios que tienen el prefijo “.” son ocultos, por lo que se debe agregar el parámetro “-a” a “ls” para poder ver la carpeta.

#### Contenido del archivo

Tiene tres secciones:

* Clusters: Configuración de clústers utilizados.

* Contexts: Asocia un cluster a un usuario.

* Users: Usuarios utilizados para login (aquí van los certificados).

El formato utilizado es _YAML_:

`apiVersion: v1 kind: Configclusters: name: <MiCluster1>  cluster:   certificate-authority: <CACert>   #Opcional   #certificate-authority-data: <ContenidoCertEnBase64>   server: <https://MiCluster1:6443/> contexts: name: <MiUsuario1>@<MiCluster1>     context:        cluster: <MiCluster1>       user: <MiUsuario1>       #Opcional       #namespace: <MiNamespace1> users: name: <MiUsuario1>     user:        client-Certificate: <CertDeUsuario>       client-key: <LlaveDeUsuario>current-context: "<MiUsuario1>@<MiCluster1>"`

* Para ver el contenido usar el comando `kubectl config view`

* Para elegir un contexto utilizar `kubectl config use-context <NombreContexto>` (agregar parametro `--kubeconfig <archivo>` para utilizar otro archivo)

* Para setear un parametro utilizar `kubectl config set <seccion.parametroOItem.Propiedad> <valor>`

* Para ver el contexto actualmente utilizado, usar `kubectl config current-context`

Encryption at rest
------------------

_Kubernetes_ utiliza _Data encryption at rest_ para los _secrets_ nativos, para lo cual utiliza una _llave de encripción_ que permite ofuscar el valor de la información. Luego el parámetro `--encryption-provider-config` enviado al _Kube-APIServer_ al iniciarlo con su binario es el que monta el un _manifiesto_ que contiene esta llave.

**Generar llave de encripción**

`ENCRYPTION_KEY=$(head -c 32 /dev/urandom | base64)`

**Manifiesto de EncryptionConfig**

`apiVersion: v1 kind: EncryptionConfig resources: - resources: - secrets providers: - aescbc: keys: - name: key1 secret: ${ENCRYPTION_KEY} - identity: {}`

API Groups
----------

A alto nivel, los recursos se diferencian entre aquellos que son _Core_ (nucleo, nativas) y aquellos que son _Named_ (funcionalidad extendida). Los recursos core se acceden mediante el _URL Path_ /api, mientras que las named con el _path_ /apis; dentro de estos grupos existen versiones como v1, v1beta, etc.

Luego, cada _Recurso_ (u _objeto_) dentro de un grupo tiene sus propios _verbos_ (o _métodos_) que indican qué operaciones se pueden realizar con el mismo.

### Core

* Namespaces

* Pods

* events

* PV

* PVC

### Named

* /apps

* /extensions

* /networking.k8s.io

* /storage.k8s.io

* /authentication.k8s.io

* /certificates.k8s.io

### Otras consultas API

Obtener versión de _Kubernetes_:

`/version`

Métricas:

`/metrics`

Salud:

`/healthz`

Logs:

`/logs`

Mostrar todos los paths:

`/`

### Authenticación API con Kubectl Proxy

La funcionalidad _proxy_ de _kubectl_ reenvia el tráfico del localhost al clúster y le alimenta las credenciales del archivo _Kubeconfig_, ahorrandose el uso de parámetros de authenticación para comandos API ejecutados durante la ejecución del proxy.

`kubectl proxy & curl https://localhost:6443/`

Image Security
--------------

El path para las _imagenes_ de contenedores es:

_<ImageRegistry>/<UserAccount>/<Repositorio:Imagen>_

Repositorios conocidos:

\-Google: [http://gcr.io](http://gcr.io)

\-Docker: [http://docker.io](http://docker.io)

La _UserAccount_ por defecto es _Library_, que se utiliza al no declarar ninguna.

#### Repositorio Privado

Autentica con un secreto de tipo _docker-registry_, que contiene el _servidor_ y las _credenciales_ de acceso al _repositorio_. Luego, el campo _spec.imagePullSecrets_ dentro del template del _pod_ indica qué secreto utilizar para traer una imagen del repositorio:

`kubectl create secret docker-registry regcred --docker-server=<servidor> --docker-username=<usuario> --docker-password=<clave> --docker-email=<correo>`

Security Contexts
-----------------

Los _contextos de seguridad_ de **Linux** sirven para definir reglas de comportamiento del sistema de archivoso el propio _SO_. En _Kubernetes_ se pueden aplicar a nivel _pod_ (aplica a todos los _containers_), a nivel _container_ o en ambos (_pods_ y _containers_ tienen su propia configuración). Algunos casos particulares también se pueden aplicar a volúmenes.

Alungos _SC_ solo aplican a nivel _pod_.

Para aplicar el contexto, se agrega lo siguiente sobre la sección _spec_ (sea del pod o del container): `securityContext:  runAsUser: 1000`

Ejemplo de un caso con SC distintos a nivel POD y container:

`spec:  securityContext: runAsUser: 1001  containers:  -  image: ubuntu     name: web     command: ["sleep", "5000"]     securityContext: runAsUser: 1002  -  image: ubuntu     name: sidecar     command: ["sleep", "5000"]`

El pod utiliza el usuario con ID 1001, al igual que el container “sidecar” porque lo hereda. Por otro lado, el container nombrado “web” utiliza el usuario id 1002, declarado de forma implícita en su _spec._

El ID del usuario Root es 0.

##### Capabilities

Las _capabilities_ de **Linux** permiten otorgar ciertos permisos a un proceso, sin necesariamente darle permisos _root_.

Solo están disponibles a nivel _container_, agregandolas sobre la sección _spec_:

`securityContext:  runAsUser: 1000 capabilities:    add: ["MAC_ADMIN"]`

Más info. en [https://kubernetes.io/docs/tasks/configure-pod-container/security-context/](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).

Network Policy
--------------

* **Egress:** Tráfico externo

* **Ingress:** Tráfico interno

_Objeto_ que permite administrar el tráfico que recibe/envía un _pod_. Se asocia mediante el uso de _selectores_ de _labels_, al igual que un _ReplicaSet_ o un _Service_.

Por defecto, no existen restricciones de _Ingress_/_Egress_ a los _pods_, pero al crear una _Network Policy_, se restringe todo el tráfico menos aquel permitido por la política.

Las policies deben redactarse desde la perspectiva del _pod_ que aplica, para determinar correctamente la dirección del tráfico. Además, nótese que deben considerarse las “dos direcciones” de tráfico, para que la conexión suceda con éxito.

Las policies trabajan con la operación lógica “_unión_”, por lo que se combinan al declararse varias.

Al habilitar Ingress traffic, por defecto se habilitan las respuestas a ese tráfico (pseudo _egress_).

Algunos rangos _CIDR_ útiles son:

* 10.0.0.0/32: Incluye solo la IP indicada

* 10.0.0.0/24: Incluye el último octeto, o sea 10.0.0.0-10.0.0.255

* 10.0.0.0/16: Incluye los últimos dos octetos, o sea 10.0.0.0-10.0.255.255

* 0.0.0.0/0: Incluye a toda la red

Nota: El rango 10.0.0.0 es un ejemplo, pero puede ocupar su lugar cualquier IP.

Ejemplo de _Netpol_:

`apiVersion: networking.k8s.io/v1 kind: NetworkPolicy metadata:  name: <nombre> spec:  podSelector:    matchLablels:      label1: value1  policyTypes: - Ingress - Egress #Notese cambio de seccion ingress: - from: - ipBlock: cidr: 172.17.0.0/16 except: - 172.17.1.0/24 - namespaceSelector: matchLabels: project: myproject - podSelector: matchLabels: role: frontend ports: - protocol: TCP port: 6379 egress: - to: - ipBlock: cidr: 10.0.0.0/24 ports: - protocol: TCP port: 5978`

Nótese que _ports_ está al mismo nivel que _from_.

### Habilitar todo el tráfico

Para habilitar todo el tráfico de un tipo, dejar el _podSelector_ vacío, al igual que la sección _ingress_ o _egress_ (según corresponda):

`apiVersion: networking.k8s.io/v1 kind: NetworkPolicy metadata: name: allow-all-ingress spec: podSelector: {} ingress: - {} policyTypes: - Ingress`

### Habilitar todo el tráfico para un pod

Omitir secciones _From_ o _To_, con la opción de declarar un puerto de destino.

`apiVersion: networking.k8s.io/v1 kind: NetworkPolicy metadata:  name: <nombre> spec:  podSelector:    matchLablels:      label1: value1  policyTypes: - Ingress ingress: #Opcional, para un puerto de destino ports: - protocol: TCP port: <Puerto>`

### Habilitar uso de DNS interno

`ports:    - port: 53      protocol: UDP    - port: 53      protocol: TCP`

### Denegar todo el tráfico

Dejar en blanco el _podSelector_ y declarar un _policyType_, pero omitir las secciones _ingress_/_egress_ por completo:

`apiVersion: networking.k8s.io/v1 kind: NetworkPolicy metadata: name: default-deny-ingress spec: podSelector: {} policyTypes: - Ingress`

### Aclaración importante sobre los Arrays y los Diccionarios en una NetPol

Siendo que la sección _from/to_ recibe Items (Array), cada item de la regla (inicia con “-”) es una subregla nueva y entre varias actuan como el operador lógico “o” (“or”):

`-podSelector:  matchLablels:    label1: value1  -namespaceSelector:   matchLablels:     label1: value1`

En caso de crear dos items en una misma regla, en cambio, el operador lógico sería “y” (“and”):

`-podSelector:  matchLablels:    label1: value1  namespaceSelector:   matchLablels:     label1: value1`

##### Comandos de Netwrok Policies

`kubectl get netpol`

Para más información, ver [https://kubernetes.io/docs/concepts/services-networking/network-policies/](https://kubernetes.io/docs/concepts/services-networking/network-policies/).

![:file_cabinet:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f5c4.png) Almacenamiento
================================================================================================================================================================

Storage en Docker
-----------------

_Docker_ por defecto arma una estructura de carpetas sobre el host, en la ruta _/var/lib/docker_.

Es importante entender además que esta plataforma trabaja con _capas_ (o _layers_), donde cada capa es una adición de información o configuración sobre la capa inicial, que es la _imagen_; al concebir la _imagen_ final, se convierten las _capas_ en solo lectura. Además, arma un _caché_ con esas capas, para utilizarlas para _imágenes_ similares (a las cuales les aplica otras capas arriba).

Luego, al encender un _container_ con esa _imagen_, el mismo ocupa una _capa_ más, que es de lectura/escritura. Al trabajar sobre esa capa, la imagen y sus capas quedan intactas.

Tipos de montado hacia un container:

\-**Volume**: Monta un volumen a una ruta.

\-**Bind**: Monta una ruta hacia otra ruta (como _volúmen_).

Storage Drivers
---------------

Son controladores que se encargan de negociar y proveer almacenamiento a los _containers_, con hardware (usualmente virtual) del host.

Existen varias opciones, todas de terceros:

* AUFS

* ZFS

* BTRFS

* Overlay

Volume Drivers
--------------

Controladores que administran los montajes de _volúmenes_ sobre los _containers_.

Existen varias opciones:

* Local (Default)

* Convoy

* GlusterFS

Container Runtime Interface (CRI)
---------------------------------

Interfaz de _K8s_ que estandariza la interacción de _contenedores_ con diferentes _motores de runtime_ (plataformas de virtualización de containers). De esta forma, se puede correr _Kubernetes_ con _container runtime_ a elección, siempre y cuando sea _CRI-Compliant_.

Runtimes disponibles:

* Docker (Deprecado)

* rkt

* cri-o

* containerd

Luego, los _containers_ compatibles con estos _runtimes_ son aquellos que cumplan con el estandar _OCI_ (_Open Container Initiative_).

[https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)

Container Storage Interface (CSI)
---------------------------------

Interfaz que estandariza la interacción de _contenedores_ con diferentes _Storage Drivers_.

La interfaz no es propia de Kubernetes, sino que es un estándar universal.

Volumes (Volúmenes)
-------------------

Por defecto están pensados para ser transitorios y solo estar activos durante la duración del _container_ (o del _pod_ en caso de _K8s_). Para tener persistencia, se utilizan volúmenes externos que se adjuntan al _pod_, definiendo la configuración en la sección _spec_:

`spec:  volumes:   - name: <nombreVolumen>  hostPath:      path: /data      type: Directory`

Luego de definir el _volúmen_, debe definirse el _montaje_:

`spec:  containers:    - name: container1      volumeMounts:        - name: <nombreVolumen>          mountPath: /etc/mounts/myvolume`

Nótese  que definir un volumen de esta forma implica un desafío de administración, por lo que es mejor utilizar _volúmenes persistentes_ (_PersistentVolume_) y fuera de los discos de los _nodos_.

Existen diferentes tipos de soluciones para alojar el almacenamiento que ocupan los _volúmenes_:

* Localhost (por defecto, en el disco de un nodo)

* NFS

* GlusterFS

* Cloud Providers (AWS EBS/Azure Disks/GCP)

* Flocker

* Ceph

###

Persistent Volume

_Volúmen_ persistente que luego puede ser reclamado por los _pods_ y cuya existencia no depende de la existencia de estos últimos.

Esto comprende aprovisionamiento de tipo estático, aunque existe también el aprovisionamiento dinámico (por ejemplo en los _Cloud Providers_).

`apiVersion: v1 kind: PersistentVolume metadata:  name: pv-vol1 spec:  accessModes:    - ReadWriteOnce  capacity:    storage: 1Gi  awsElasticBlockStore:    volumeID: <volume-id>      fsType: ext4   persistentVolumeReclaimPolicy: Retain`

El campo `persistentVolumeReclaimPolicy` indica qué sucede con el _volúmen_ luego de que el _pod_ lo libere.

Para utilizar un _PV_ del tipo _hostPath_, donde el volumen se monta sobre un _nodo_ (no recomendado), utilizar esta definición:

`apiVersion: v1 kind: PersistentVolume metadata: name: pv-analytics spec: capacity: storage: 100Mi accessModes: - ReadWriteMany hostPath: path: /pv/data-analytics`

### Persistent Volume Claim

Es una _petición de volúmen_ con ciertas características deseadas, que busca un volúmen persistente que las cumpla al menos en el mínimo (en tamaño puede sobrar espacio, aunque es poco efectivo).

Una vez adquirido el volúmen, se asocia el mismo a la petición y ningún otro _PVC_ (_PersistentVolumeClaim_) puede reclamarlo. Si no encuentra volúmenes compatibles, queda como pendiente.

Las características que busca cumplir son:

* Sufficient Capacity

* Access Modes

* Volume Modes

* Storage Classes

* Label Selector

Al eliminar un PVC utilizado por un _pod_, queda en estado _Terminating_ hasta que el _pod_ lo libera.

Yaml de ejemplo:

`apiVersion: v1 kind: PersistentVolumeClaim metadata:  name: pvc1 spec:  accessModes:    - ReadWriteOnce  resources:    requests:      storage: 500Mi`

Para utilizar un _PVC_ en un _pod_:

`spec:  containers:    - name: myfrontend      image: nginx      volumeMounts:      - mountPath: "/var/www/html"        name: mypd  volumes:    - name: mypd      persistentVolumeClaim:        claimName: myclaim`

Al bindearse (asociarse) un _PersistentVolumeClaim_ a un _PersistentVolume_, la definición del _PV_ en memoria lleva una sección de _claimRef_ que tiene los datos del _PVC_ asociado:

`claimRef:      apiVersion: v1      kind: PersistentVolumeClaim      name: local-pvc      namespace: default      resourceVersion: "1009"      uid: df37b253-ad40-4216-8288-1157cb1d41f1`

El _PVC_, en cambio, agrega el valor _volumeName_ en la sección _spec_; ambos cambian de estado.

### Storage Classes

Define una _clase de almacenamiento_ alojada por un proveedor -usualmente cloud-  que permite el _aprovisionamiento dinámico_ de volúmenes, permitiendo no tener que definir un _PersistentVolume_ manualmente (se crea igual, pero se forma automática en base al _PersistentVolumeClaim_).

Se pueden crear varios tipos de _SC_ y utilizarlos como _tiers_ de volúmenes en _K8s_.

Yaml de ejemplo:

`apiVersion: storage.k8s.io/v1 kind: StorageClass metadata:  name: google-storage provisioner: kubernetes.io/gce-pd volumeBindingMode: WaitForFirstConsumer parameters:   <parámetrosDelProvider>`

Uso:

`apiVersion: v1 kind: PersistentVolumeClaim metadata:  name: pvc1 spec:  accessModes:    - ReadWriteOnce  storageClassName: google-storage  resources:    requests:      storage: 500Mi`

En el caso de los _cloud providers_, generalmente crean un disco virtual (_PAAS_) del tipo soportado.

Las _clases_ que utilizan el provisioner [kubernetes.io/no-provisioner](http://kubernetes.io/no-provisioner "http://kubernetes.io/no-provisioner") no soportan aprovisionamiento dinámico.

![:globe_with_meridians:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f310.png) Networking
====================================================================================================================================================================

Comandos de Networking
----------------------

### En Linux

La configuración de red de _Kubernetes_ está fuertemente inspirada en la configuración de red de _Linux_.

Para que los cambios realizados por los comandos sean persistentes, deben agregarse en la configuración de red.

* Buscar una cadena de texto en la salida de otro comando: `<comando> | grep <cadena>` o bien `<comando> | grep -i ^<cadena>` para _Regex_.

* Ver procesos de _SO_: `ps -aux`

* Ver IP: `ifconfig` o `ip addr`

* Ver interfaces de red: `ip link`

* Asignar IP: `ip addr add <ip>/24 dev eth0`

* Ver rutas y Gateways configurados: `route`

* Agregar ruta: `ip route add <IPDestino/24 via <IPGateway>`

* Ruta default para cualquier red no conocida:`ip route add default via <IPGateway>`

Como _gateway_ usualmente se utiliza el router.

* Activar forwardeo de paquetes entre interfaces de red:

`#Obtener valor del archivo cat /proc/sys/net/ipv4/ip_forward #Habilitar echo 1 > /proc/sys/net/ipv4/ip_forward #Deshabilitar echo 0 > /proc/sys/net/ipv4/ip_forward`

Es un archivo con valor _booleano_.

* Ver archivo hosts de DNS: `cat /etc/hosts`

* Ver servidores DNS configurados: `cat /etc/resolv.conf`

Ejemplo de archivo _resolv.conf_:

`nameserver <IPServer1> nameserver <IPServer2> nameserver <IPServer3>`

Para agregar un _dominio_ base en los queries DNS, agregar una línea con formato `search <dominio1> <dominio2>`. De esta forma, todos los nombres _DNS_ se intentarán completar con esos dominios (formando un _Fully-Qualified-Domain-Name_ o _FQDN_) en primer lugar y luego se hará failover con un query DNS normal.

* Ver orden de preferencia para resolución DNS:

`#Ver cat /etc/nsswitch.conf #Cambiar a Host file primero hosts: file dns #Cambiar a DNS server primero hosts: dns file`

Por defecto, las consultas van al archivo _Hosts_ en primera instancia y luego al archivo de _DNS_ (_resolv.conf_). La excepción a la regla es la herramienta **NSLookup**, que utiliza los _Nameservers_ directamente.

* Alternativa a nslookup: `dig <dominio>`

* Forwardear puerto: `iptables -t nat -A PREROUTING --dport <puertoEntrada> --to-destination <ip>:<puertoDestino> -j DNAT`

* Ver IP y MAC de vecino de red: `arp <hostname>`

* Ver estadísticas de red por proceso: `netstat -nplt`

* Ver conexiones establecidas por un proceso: `netstat -anp | grep etcd`

### Trabajar con Namespaces en Linux

Los _Namespaces_ en _Linux_ también separan los recursos para un determinado grupo de procesos. Esta es una situación deseada para los _containers_, que deben correr aislados de los detalles del _Host_.

En el caso particular de los ejemplos a cotninuación, se aislan recursos de red.

* Ejecutar comando dentro de un Namespace de red: `ip netns <Namespace> exec Ccomando>`

* Conectar dos _Namespaces_:

    1. Linkear dos interfaces de red: `ip link add <interfaz1> type veth peer name <interfaz2>`

    2. Asociar cada interfaz a un Namespace: `ip link set <interfaz1> netns <Namespace1>;ip link set <interfaz1> netns <Namespace1>`

    3. Agregar una IP para cada interfaz: `ip -n <namespace1> addr add  <ip1> dev <interfaz1>;ip -n <Namespace2> addr add  <ip2> dev <interfaz2>`

    4. Encender interfaces: `ip -n <namespace1> link set <interfaz1> up;ip -n <Namespace2> link set <interfaz2> up`

* Conectar múltiples _Namespaces_:

    1. Crear una interfaz de red en modo _bridge_ (_Linux Bridge_ nativo) para que actúe como _Switch_: `ip link add <InterfazSwitch> type bridge`

    2. Encender interfaz switch: `ip link set dev <InterfazSwitch> up`

    3. Por cada Namespace, crear una interfaz para el mismo y otra para su puente (_bridge_) hacia el _Switch_: `ip link add <InterfazNamespace-i> type veth peer name <InterfazNamespace-i-Bridge>`

    4. Por cada Namespace, asignar la interfaz creada al mismo: `ip link set <InterfazNamespace-i> netns <Namespace-i>`

    5. Por cada Namespace, asociar la interfaz bridge creada al extremo del _Switch_, como _Master_: `ip link set <InterfazNamespace-i-Bridge> master` `<InterfazSwitch>`

    6. Por cada Namespace, agregar una dirección IP: `ip -n <Namespace-i> addr add  <IP-i> dev <InterfazNamespace-i>`

    7. Por cada Namespace, encender las interfaces: `ip -n <Namespace-i> link set <InterfazNamespace-i> up`

    8. \-Opcional- Para tener conectividad con el _Host_, agregar una dirección IP a la interfaz del _Switch_: `ip addr add <IP-Interfaz-Switch> dev <Interfaz-Switch>`

    9. \-Opcional- Para tener conectividad desde la red privada armada al mundo externo, se puede utilizar el _Host_ como _Gateway_. Por cada Namespace ejecutar: `ip netns exec <Namespace-i> ip route add default via <IPLocalHost>`. Además, activar el _Nateo_ en el _Host_ para que los paquetes se envien en nombre del mismo: `iptables -t nat -A POSTROUTING -s <RangoDeIPNamespace>/<Tamaño> -j MASQUERADE`

    10. \-Opcional- Para tener conectividad desde el mundo externo a la red privada, armar un forwardeo de puerto del _Host_ hacia la red: `iptables -t nat -A PREROUTING --dport <puertoEntrada> --to-destination <IP-Interfaz-Switch>:<puertoDestino> -j DNAT`

Diagrama del último ejemplo:

Open

### En Docker

* Forwardear puerto a un container: `docker run -p <puertoOrigen>:<PuertoDestino> <container>`

Networking en Docker
--------------------

Pueden crearse _containers_ con redes de tipo:

a-Sin red

b-Compartiendo la red del host (limitado en cuestión de puertos)

c-_Bridge_: Esta topología define una red privada de _Namespaces_ interconectada por un _Switch_, que a su vez tiene conexión con el _Host_; luego los _containers_ se conectan a cada _Namespace_.

Container Networking Interface (CNI)
------------------------------------

Es un _plugin_ de red que estandariza librerías y formas de conectar _containers_ _Linux_ a la red, de forma _vendor-neutral_. Es un proyecto incubado bajo el ala de _CNCF_ y es utilizado por _Kubernetes_, _CRI-O, Mesos_ y otros.

En general se ejecuta como _script_ o como _binario_ ejecutable y su estandarización hace que sea compatible con diferentes plataformas; cada _vendor_ puede desarrollar su propio _plugin_, pero respetando los estándares preestablecidos.

[https://github.com/containernetworking/cni](https://github.com/containernetworking/cni)

_Network Addons_ disponibles para _K8s_:

* Calico

* Flannel

* Weave Net

Entre otros.

Para más información, ver artículos: [https://kubernetes.io/docs/concepts/cluster-administration/addons/](https://kubernetes.io/docs/concepts/cluster-administration/addons/) y [https://kubernetes.io/docs/concepts/cluster-administration/networking/#how-to-implement-the-kubernetes-networking-model](https://kubernetes.io/docs/concepts/cluster-administration/networking/#how-to-implement-the-kubernetes-networking-model).

### Obligaciones del estándar

El estándar _CNI_ implica que un _Network Plugin_ compatible debe cumplir ciertos requisitos:

* Debe soportar comandos ADD/DEL/CHECK

* Debe soportar parámetros ContainerID, NetworkNS, entre otros

* Debe encargarse de las asignaciones de IPs a los _containers_ o _pods_

* Toda la configuración de red debe negociarse en formato _JSON_

_Docker_ utiliza otro estándar llamado _CNM_ (_Container Networking Model_).

Conexión de containers a la red
-------------------------------

### Forma general

Todas las soluciones de _contenerización_ utilizan la siguiente metodología -a gran escala- para conectar containers dentro de un host:

1)Crear _Network Namespace_ (_netns_)

2)Crear _switch virtual_ en modo _Bridge_

3)Crear 2 _Virtual Ethernets_ (_vEths_) para conectar al _netns_

4)Adjuntar _vEth1_ al _netns_

5)Adjuntar _vEth2_ al _Bridge_

6)Asignar direcciones _IP_ a ambas _VE_ths

7)Encender _interfaces_ de red de ambas _VE_ths

8)Habilitar _nateo_ con IP _Masquerade_ mediante la _IP_ del _Host_

### Estándar definido por CNI

1)El _Container Runtime Interface_ (_CRI_) crea un _Network Namespace_

2)Identificar red a conectar al _container_

3)El _CRI_ invoca el _Network Plugin_ cuando se agrega un _container_, con el verbo _add_

3)El _CRI_ invoca _Network Plugin_ cuando se elimina un _container_, con el verbo _del_

Red en Kubernetes
-----------------

### Node Layer

Cada _host_ (_nodo_) debe tener su interfaz de red, IP y hostname únicos. Además, debe tener una serie de puertos abiertos (para atender los diferentes servicios que aloja).

### Pod Layer

_Kubernetes_ no trae una solución built-in de networking en este nivel, sino que hay que integrar con una solución de terceros. Para esto -más allá del _Network Plugin_ utilizado- el estándar _CNI_ actúa como _middleman_ e indica qué configuración debe utilizar _K8s_ para invocar el _plugin_ cada vez que debe conectar un _pod_; esta configuración se envía como parámetro al _Kubelet_ (de cada _nodo_).

#### Requerimientos de modelo de red

\-Todo _pod_ debe tener una IP única

\-Debe existir comunicación de red entre todos los _pods_, sin _nateos_

#### IP Address Assignment Management (IPAM)

Lo único que requiere _Kubernetes_ en este sentido es que no haya duplicados de _IPs_. La configuración _CNI_ tiene una sección de configuración _IPAM_, donde se define la herramienta a la cual delegar la configuración _IP_:

`"ipam": { "type":"host-local", "subnet":"<subnet>", ...}`

Las soluciones locales disponibles son:

* Host-Local

* DHCP

También está la posibilidad de dejar esta tarea en manos del _Network Plugin_. Por ejemplo, el _plugin_ de _Weaveworks_ utiliza el rango de _IP_ `10.32.0.0/12` (1 millon de IPs).

### Uso de CNI en K8s

Los parámetros `--network-plugin` (_plugin_ a utilizar), `--cni-bin-dir` (ruta de ejecutables de _plugins_ soportados) y `--cni-conf-dir` (configuración _CNI_) indican al _Kubelet_ de cada _nodo_ cómo operar con la red.

Usualmente se encuentran los _binarios_ de los _plugins_ soportados en _/opt/cni/bin_ y la configuración en _/etc/cni/net.d_.

### Weave Net CNI (Network Plugin)

Este es un _Network Plugin_ de **Weaveworks**, compatible con _Kubernetes_.

Utiliza un _agente_ en cada nodo (desplegado como _Daemonset_) como conector entre la red principal y el resto de los _nodos_. No solo se encarga de ejecutar el _CNI_ plugin de cada _nodo_ para conectar un _pod_ a la red, sino que además de estar consciente de la topología de red y de qué _nodo_ aloja qué direcciones _MAC_; de esta forma, logra conectar todos los _pods_

Para su despliegue en _K8s_ necesita además _Roles_, _ClusterRoles_, una _ServiceAccount_ y los correspondientes _bindings_ a los roles mencionados. Para más detalles sobre cómo instalar, ver artículos: [https://www.weave.works/docs/net/latest/kubernetes/kube-addon/](https://www.weave.works/docs/net/latest/kubernetes/kube-addon/) y [https://www.weave.works/docs/net/latest/kubernetes/](https://www.weave.works/docs/net/latest/kubernetes/).

Service Networking
------------------

Los _service_ (o servicios) de _Kubernetes_ son unidades lógicas y no un _pod_ o una _VM_ en sí. Además, son recursos disponibles _cluster-wide_ y no sobre un solo _nodo_ (pero si son _Namespaced_). El _Kube-APIServer_ le asigna una _IP_ a cada _servicio_, de las disponibles en el rango _CIDR_ declarado con el parámetro `--service-cluster-ip-range` enviado al encender el componente. Por defecto ocupa el rango 10.0.0.0/24 (10.0.0.0-255) y no debe coincidir con el rango que usan los _pods_ con la solución _CNI_.

Los encargados de hacer funcionar la conectividad _service_\-_pod_ (back-end) son los componentes _Kube-Proxy_ de cada _nodo_, que con la _IP_ del _servicio_ arman una regla de _traffic forwarding_ (usando _iptables_ o _ipvs_) para el tráfico que llega a la _IP_ del _servicio_ hacia la _IP_ del _pod_ (back-end). Suelen dejar logging del _servicio_ -y por ende de _iptables_\- sobre la ruta `/var/log/kube-proxy.log` (también se pueden ver los logs del _pod_).

Open

DNS en Kubernetes
-----------------

### Kube-DNS (default)

Es una capa de las últimas a configurar en materia de _Networking_, ya que primero tiene que haber conexión _IP_ entre todos los componentes, según parámetros esperados.

Esta solución está compuesta por un _pod_ (por el cual vela un _deployment_) que actua como _Nameserver_ y se expone mediante un _service_ llamado _kube-dns_.

Open

### DNS para services

Este componente crea un registro _DNS_ para cada _servicio_, junto con su _IP_ (asignada a nivel _clúster_ por el _Kube-APIServer_). El registro creado es de tipo _A_ o _AAAA_ y carga la _IP_ del _servicio_, aunque -si el servicio es _Headless_\- puede cargar también las _IPs_ de los _Endpoints_ declarados para el _servicio_. Además, se crea un registro de tipo _SRV_ por cada puerto “nombrado” (_named_) que expone, con el formato `_<NombrePuerto>._<Protocolo>.<ServiceNombre>.<NamespaceNombre>.svc.cluster-domain.example`.

El _FQDN_ de cada servicio tiene el formato `<ServiceNombre>.<NamespaceNombre>.svc.cluster.local`. Esto se debe a que por cada _Namespace_ el componente _Kube-DNS_ crea un _subdominio_ con el nombre del mismo, dentro del cual se registran los records de los _servicios_. Luego a todos los _subdominios_ de _namespaces_ los agrupa dentro de otro _subdominio_ llamado **svc** (`<ServiceNombre>.<NamespaceNombre>.svc`) y a este último _subdominio_ lo agrega al _dominio root_ llamado **cluster.local** (componiendo el FQDN mencionado).

Esto significa que dentro de un mismo _Namespace_, se puede invocar el _servicio_ mediante su nombre y resolver correctamente la _IP_; desde otro _NS_ \-en cambio- debe invocarse con el nombre como subdominio del _NS_ que aloja el servicio `<ServiceNombre>.<NamespaceNombre>`.

Open

[https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

Para que esto funcione a nivel _pod_ (y a nivel _container_), el _Kubelet_ alimenta la siguiente configuración por defecto a cada _pod_ que aloja:

**Archivo resolv.conf**

`nameserver <IPDeSoluciónDNSComoPod> search <namespaceNombre>.svc.cluster.local svc.cluster.local cluster.local options ndots:5`

Los dominios declarados en la sección _search_ indican los primeros dominios a consultar al recibir un nombre _DNS_ y la opción de _ndots_ con valor 5 indica que si el nombre tiene menos de 5 puntos, primero consultará todos los dominios en _search_, antes de tratarlo como un nombre absoluto (y buscar afuera).

También es configurable a nivel _pod_ el tipo de _DNSPolicy_ y -en caso de desear una configuración custom- usar _DNSConfig_ para armar una configuración local para el mismo.

### DNS para pods

El uso de _DNS_ para _pods_ no está habilitado por defecto. En caso de habilitarlo, utiliza el formato `<xxx-xxx-xxx-xxx>.<namespace>.pod.cluster.local` (_FQDN_ similar al de los _servicios_, pero en el subdominio **pod**, en vez de **svc**), donde el nombre del registro _DNS_ es la IP del pod, reemplazando puntos por guiones.

### Core-DNS

Es un servidor _DNS_ multi-proposito muy flexible, progamado en lenguaje _Go_ y que se incuba bajo el paraguas de _CNCF_. Se utiliza en general como reemplazo de _Kube-DNS_, desplegado como _deployment_ en el _Namespace_ Kube-System, donde -gracias a ciertos roles- administra la resolución _DNS_ de los _pods_.

Más info. en: [https://coredns.io/](https://coredns.io/) y [https://kubernetes.io/docs/tasks/administer-cluster/coredns/#:~:text=CoreDNS%20is%20a%20flexible%2C%20extensible,as%20the%20Kubernetes%20cluster%20DNS.&text=You%20can%20use%20CoreDNS%20instead,upgrade%20the%20cluster%20for%20you.](https://kubernetes.io/docs/tasks/administer-cluster/coredns/#:~:text=CoreDNS%20is%20a%20flexible%2C%20extensible,as%20the%20Kubernetes%20cluster%20DNS.&text=You%20can%20use%20CoreDNS%20instead,upgrade%20the%20cluster%20for%20you.).

En la versión 1.21 de _Kubernetes_, la herramienta de despliegue de clúster _Kubeadm_ directamente utiliza _Core-DNS_ en lugar de la solución nativa.

Un archivo de configuración -usualmente almacenado en `/etc/coredns/CoreFile`\- indica la configuración de la herramienta y debe montar un plugin de _Kubernetes_ para funcionar con el mismo:

`:53 { #Plugins a cargar errors health kubernetes cluster.local in-addr-arpa ip6.arpa { pods insecure #Habilita creación de DNS para pods...} prometheus: 9153 proxy: . /etc/resolv.conf #Para consultas DNS que no puede resolver, esto es sobre el nodo master cache 30 reload}`

En _Kubernetes_ este archivo se envía como _configmap_, para poder editarlo y revisarlo.

La resolución de _DNS_ que delega sobre los _NameServers_ del host (archivo resolv.conf) debe coincidir con el servicio _DNS_ de _Kubernetes_:

`#Sobre la configuración cat /etc/resolv.conf> nameserver <IPDeDNSDeK8s> search default.svc.cluster.local svc.cluster.local cluster.local #Sobre el kubelet cat /var/lib/kubelet/config.yaml clusterDNS: - <IPDeDNSDeK8s>`

Prestar atención a la entrada `default.svc.cluster.local`, ya que es gracias a ella que no se deben utilizar _FQDN_ para el _namespace_ llamado _default_.

Ingress
----------

Es una solución que permite el ingreso de tráfico externo hacia un clúster de _Kubernetes_, además de -en general- otorgar la posibilidad de terminación de conexiones TLS/SSL y resolución basada en nombres de dominio.

Se desprenden dos conceptos:

* **Ingress Resource**: Objeto API de _Kubernetes_, configurable mediante un manifiesto. El mismo declara la ruta del tráfico de ingreso externo para un caso particular, declarando _nombre de dominio_, _URL Path_ y _Back-end_ (un _service_ de _Kubernetes_).

* **Ingress Controller**: _Controlador_ externo integrado con el servicio _Ingress_ de _Kubernetes_ que se encarga de proveer y configurar la infraestrucutra de red (usualmente un _LoadBalancer_ y en ocasiones algún servidor _HTTP_) necesaria para alojar las rutas declaradas en los manifiestos _Ingress_. Este _driver_ analiza los recursos _Ingress_ desplegados y configura su capa _HTTP_ para cumplir con las mismas.

Kubernetes no tiene un _Ingress Controller_ por defecto.

Más info. en: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/).

### Ingress controllers

Algunos de los _IC_ más conocidos son:

* NGINX (Soportado oficialmente)

* TRAEFIK

* HAPROXY

* ISTIO

Un _controlador_ de este tipo se despliega como _deployment_ dentro del clúster.

#### Annotations

En general los ICs tienen configuraciones extendidas que se envian como _annotations_ sobre el manifiesto _Ingress Route_. Por ejemplo, en el controlador de _NGINX_ (ver artículo [https://kubernetes.github.io/ingress-nginx/examples/](https://kubernetes.github.io/ingress-nginx/examples/)) el parámetro `-rewrite-target` permite omitir el _URL Path_ enviado al _Ingress_, o bien sobreescribirlo con otro valor, para casos donde el _path_ utilizado por el mismo no coincida con los path mapeados dentro de la aplicación (sobreescribe el path con el path declarado en `rules.http.paths.path`).

### Ingress Route

Manifiesto ejemplo:

`apiVersion: networking.k8s.io/v1 kind: Ingress metadata:  name: <nombreIng>  annotations:    nginx.ingress.kubernetes.io/rewrite-target: / spec:  rules: - host: <DominioURL> http:      paths:      - path: <Path>        pathType: Prefix        backend:          service:            name: <nombreSvc>            port:              number: <Puerto>   name: <nombrePto>`

### Ingress class

Una _clase_ de _Ingress_ define qué tipo de _controlador_ _Ingress_ (o mejor dicho, cual) interpreta un manifiesto _Ingress route_ particular. Esto se debe a que pueden existir múltiples _IC_ conviviendo en un clúster.

Hasta la versión 1.18 de _Kubernetes_, extraoficialmente se utilizaba la _annotation_ `kubernetes.io/ingress.class` para definir el controlador a utilizar, pero en esta versión se definió un nuevo campo en la sección `spec` llamada `ingressClassName` que permite definir el controlador a utilizar en un campo oficialmente habilitado para ello.

Para que esto funcione, debe existir una _Ingress Class_ que declara el _controlador_ a utilizar, el nombre de la clase y además la posibilidad de definirla como default (_annotation_ `ingressclass.kubernetes.io/is-default-class: "true"`).

`apiVersion: networking.k8s.io/v1 kind: IngressClass metadata: labels: app.kubernetes.io/component: controller name: nginx-example annotations: ingressclass.kubernetes.io/is-default-class: "true" spec: controller: k8s.io/ingress-nginx`

### Caso de Service tipo Load Balancer

Cuando se utiliza un _service_ de tipo _Load Balancer_, el _Cloud Provider_ utiliza su propio servicio _PAAS_ de _Proxy_ y ese está configurado para redirigir el tráfico a los puertos X de los _nodos_, donde el servicio expone la aplicación deseada.

### Comandos Ingress

* Crear Ingress:

`kubectl create ingress <ingress-name> --rule="host/path=service:port"`

![:diamond_shape_with_a_dot_inside:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4a0.png) Diseño de un clúster Kubernetes
==========================================================================================================================================================================================================

Alta disponibilidad (High Availability)
---------------------------------------

Los lineamientos generales de diseño para un clúster de _K8s_ son:

\-Contar con un mínimo de 4 _nodos_

\-No alojar cargas de trabajo en _nodos_ _master_ (para ello utilizar _taints_)

\-Alojar el servicio de _ETCD_ de forma externa y en _HA_

\-Contar con múltiples _master nodes_ para evitar fallas de servicios _API_

\-Utilizar un _Load Balancer_ para exponer el _Kube-APIServer_ al utilizar múltiples _control plane nodes_

### HA en componentes Stateful de Kubernetes

Aquellos componentes del sistema que no son _Stateless_ tienden a operar en modo _Active-Standby_ para lograr alta disponibilidad, donde el proceso de _leader-election_ define cual es la instancia de la componente activa y el resto opera en modo _StandBy_. En general, tienden a bloquear un objeto de _Kubernetes_ (como un Endpoint) haciendo una modificación y re-iniciar el proceso de _LE_ luego de cierto período de tiempo (definido por parámetros de inicio del binario).

### ETCD en HA

Trabaja con varias instancias de la base de datos, donde una sola instancia actua como lider; luego cualquiera permite operaciones de lectura y las operaciones de escritura las coordina el lider (sincronizando todas las instancias).

Para el proceso de _Leader-election_, utiliza el protocolo _RAFT_, que utiliza un sistema de timers aleatorios, donde el primer nodo en finalizar el timer se autoproclama lider (informando a los demás nodos); luego les envia confirmaciones períodicas indicando que sigue asumiendo dicho rol y -en caso de no recibir esas notificaciones- los nodos restantes inician nuevamente el proceso de LE.

El término _quorum_ indica el número de nodos mínimo que el clúster necesita para operar propiamente, que se deduce de la fórmula: Nodos/2 + 1 (parte entera). Como en la mayoría de los clústers HA, se recomiendan números impares de nodos, con un mínimo de 3.

Opciones de despliegue
----------------------

\-**Turnkey solutions**: Soluciones que facilitan el despliegue de un clúster _K8s_, donde el mantenimiento y aprovisionamiento del clúster (y sus _Virtual Machines_) queda a cargo del usuario. Opciones conocidas: Open-Shift, Cloud Foundry CR y Vagrant.

\-**Hosted solutions**: Soluciones _Kubernetes-As-A-Service_ que brindan _cloud providers_ donde prácticamente todo el mantenimiento queda a cargo del proveedor. Opciones conocidas: GKE, Open Shift Online, AKS y EKS.

### Creación manual de un clúster (Hard Way)

En este tipo de configuración se instalan los componentes como _binarios_ en los _hosts_ (o _nodes_) y se los configura como servicios _Systemd_ de _Linux_. Luego uno de los _master nodes_ es el _Certification Authority_ para _TLS_ y todos los componentes se comunican con sus propios pares de llaves _TLS_, con encripción punta a punta.

Sin entrar en detalles, se realizan los siguientes pasos:

1. Disponer infraestructura con -al menos- 1 _master_ y 1 _worker nodes_ (2 y 2 para tener alta disponibilidad)

2. Definir si el clúster _ETCD_ se monta con su propia infraestructura o en modo _stacked_ (instalado sobre el mismo clúster)

3. Elegir un _master node_ como _Certification Authority_, emitir su par de llaves _TLS_, auto-firmar (self-sign) su certificado público y guardarlos

4. Emitir pares de certificados cliente -y firmar con el _CA_\- para todos los componentes y usuarios:

    1. _Kube-APIServer_

    2. _Kube-Scheduler_

    3. _Kube-ControllerManager_

    4. _ETCD_

    5. _Service Accounts_ (Utilizado por _Kube-Controller-Manager_ para autorizar los _tokens_ de otros _SA_)

    6. Usuario Admin

5. Repartir certificados:

    1. _Master nodes_: _CA_ (solo público), _Kube-APIServer_, _Kube-Scheduler_, _Kube-ControllerManager_, _ETCD_ (si es _stacked_), _Service Accounts_, Usuario Admin

    2. _Worker nodes_: _CA_ (solo público)

6. Descargar e instalar _Kubectl_ en los _Master nodes_

7. Crear archivos de configuracion _.kubeconfig_ con _Kubectl_ para los diferentes componentes y usuarios:

    1. _Kube-APIServer_

    2. _Kube-Scheduler_

    3. _Kube-ControllerManager_

    4. Usuario Admin

8. Instalar _ETCD_ (solo si es _Stacked_ topology)

9. Descargar e instalar _binarios_ de _Kube-APIServer_, _Kube-Scheduler_ y _Kube-ControllerManager_

10. Crear archivos de servicio _Systemd_ -y habilitar- para esos componentes de sistema, utilizando los certificados necesarios (_CA_ y propios de cada uno) y los archivos de configuración _kubeconfig_ creados previamente. Estos se envian como parámetros en la línea de ejecución del _binario_

11. Conectar al clúster con la configuración de Admin

12. Si el clúster fuera _HA_, configurar un _LoadBalancer_ a gusto para distribuir la carga a los _Master nodes_ (https://<IP>:6443)

13. Crear y firmar certificados para los _nodos worker_ (para el _Kubelet_)

14. Crear archivos de configuración _kubeconfig_ para _Kubelet_ y _KubeProxy_

15. Descargar e instalar _Container Runtime_, _Kubelet_ y _KubeProxy_ en los _worker nodes_

16. Crear servicios _Systemd_ de _Kubelet_ y _KubeProxy_, utilizando configuraciones _TLS_ (certificados) y _K8s_ (_kubeconfig_) necesarias

17. Conectar al clúster y verificar existencia del _nodo_

18. Configurar solución de _Networking_ para _pods_ (ejemplo Weave)

19. Configurar solución _DNS_ (ejemplo CoreDNS)

Open

### TLS Bootstrapping

Es una metodología de administración de certificados _TLS_ para los _nodos worker_ de _Kubernetes_. Permite que los _nodos_ se auto-generen sus propios pares de llaves _TLS_, hagan un CertificateSigningRequest para firmarlos con el _CA_ (que luego debe aprobar un administrador), los implementen en sus configuraciones _kubeconfig_ y se unan al clúster nuevamente. Prácticamente permite la auto-administración de los _nodos workers_ y su autenticación contra el clúster; esto lo hace aprovechando la _Certification-API_ de _K8s_.

Para ello se crea un _Bootstrap token_ asociado al _grupo_ `system:bootstrappers` y luego los _roles_ llamados `system:node-bootstrappers` y `system:certificates.k8s.io:certificatesigningrequests:nodeclient`asociados a dicho _grupo_. Todo esto se realiza con _ClusterRoleBindings_ sobre _roles_ nativos de _Kubernetes_.

Cuando el _nodo_ se une al clúster, ya no necesita el _bootstrap token_ y empieza a formar parte del grupo `system:nodes`, por lo que se debe asociar el rol `system:certificates.k8s.io:certificatesigningrequests:selfnodeclient` al mismo. para que pueda auto renovar el _CSR_ cuando vence el _certificado_ actual.

Para que funcione, se envía con el parámetro `--bootstrap-kubeconfig` al _Kubelet_ al iniciarlo un archivo de configuración _bootstrap-kubeconfig_ que -en vez de usar un _certificado_\- utiliza un _bootstrap token_. Además, los parámetros `--rotate-certificates` y `--rotate-server-certificates` activan la rotación de certificados, con la salvedad de que las _CSR_ de _certificados_ de servidor (no los de cliente) requieren de aprobación manual.

Nótese que el archivo `bootstrap-kubeconfig` reemplaza el archivo `kubeconfig`; de hecho, el _Kubelet_ busca la existencia del primero, en ausencia del segundo. Es luego de hacer el proceso inicial de _bootstrapping_ que el _Kubelet_ confecciona su propio archivo _kubeconfig_ con el certificado recibido.

### Creación de un clúster con Kubeadm

_Kubeadm_ es una herramienta oficial de _Kubernetes_ para facilitar la creación y mantención de clústers _K8s_.

Pasos a seguir:

1. Ver validaciones necesarias (artículo [https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)):

    1. Requisitos de hardware mínimos: 2 CPU y 2GB de RAM

    2. SO: Linux compatible (Debian o Red Hat y derivados)

    3. Red: Conectividad full, unicidad de hostnames/IPs/MACs/ProductIds y ciertos puertos abiertos

    4. Memoria SWAP deshabilitada

2. Configurar _IPTables_ para que vea tráfico de _bridge_

3. Instalar _container runtime_

4. Instalar _Kubeadm_, _Kubectl_ y _Kubelet_

5. Inicializar _control plane node_ (`kubeadm init`)

6. Guardar datos de comando `Join` que muestra _kubeadm_

7. Instalar solución de _pod networking_ como _deployment_

8. Utilizar _taints_ en el _control plane_ para aislarlo de cargas de trabajo

9. Unir _nodos worker_ al clúster (`kubeadm join`)

10. Testear integridad del clúster

11. Instalar solución de _Service DNS_ como _deployment_

Utiliza _Kube-Scheduler_, Kube-Controller-Manager, _Kube-APIServer_ y _ETCD_ como _static pods_ dentro de _K8s_, gracias al _Kubelet_ (primer componente instalado en conjunto con el _CRI_).

![:question:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/2753.png) Troubleshooting
============================================================================================================================================================

Al diagnosticar problemas en un clúster _K8s_ es necesario analizar por capas.

Application
-----------

\-Ver que la _app_ sea accesible desde afuera (_Ingress_ o _service nodePort_)

\-Ver que el _servicio_ tenga _endpoints_

\-Comparar _labels_ de _servicio_ y _deployment_ (o _pod_)

\-Revisar el _pod_ con comandos `kubectl get -o yaml` y `kubectl describe` que muestran enfoques diferentes (enfocarse principalmente en _variables de entorno_ y _volúmenes_)

\-Revisar _logs_ del _pod_ (utilizando el parámetro `-f` para hacer un _tail_ en vivo y `--previous` para ver logs de _pods_ anteriores)

\-Aplicar el mismo tipo de troubleshooting sobre otros _pods_ que componen la solución, o bien componentes externos con los que interactúa la solución

Control Plane
-------------

\-Ver estado de los _nodos_

\-Ver estado de los componentes de sistema (ya sea como servicios _Linux_ o como _deployments_ en _K8s_ -o sea sus _static pod manifests_\-)

\-Ver _logs_ del _Kube-APIServer_ (_journalctl_ o _kubectl get logs_)

Worker Node
-----------

\-Ver estado de los _nodos_ (y utilizar el comando `describe`, analizado estado de banderas de recursos esperados):

Open

\-Ver estado de la _VirtualMachine_ del _nodo_ en sí

\-Revisar estado del servicio _Kubelet_

\-Ver logs del servicio _Kubelet_ (_journalctl_)

\-Verificar que los certficados no estén vencidos, estén emitidos para los _DN_ correctos y emitidos por el _CA_ correcto

Networking
----------

\-Identificar _CNI network plugin_ en uso y ver su estado

\-Ver estado de _CoreDNS_ (corre como _deployment_, con un _rol_ asociado, un _Configmap_ y un _servicio_). Si existen pods de _CoreDNS_ que entran en _CrashLoopBackOff_, puede haber un problema de _DNS loop_ por una configuracion `resolv.conf` inválida. Se puede probar:

\-Revisar dicha configuración en el _CoreFile_ (config de _CoreDNS_) y ver que apunte a un archivo válido (normalmente `/run/systemd/resolve/resolv.conf`).

\-Agregar `resolvConf: /run/systemd/resolve/resolv.conf` (o un archivo válido) al archivo de configuración (_manifiesto_) de los _Kubelet_

\-Deshabilitar caché _DNS_ local en _nodos_ y restaurar `resolv.conf` a su config original.

\-Reemplazar el _forwarding_ del archivo _CoreFile_ por el servidor _DNS_ utilizado hacia afuera (ejemplo 8.8.8.8)

\-Ver estado de _Kube-Proxy_ (puede correr como _servicio_ de _Linux_ o como _Daemonset_ de _K8s_). Si falla _Kube-Proxy_, ver:

\-Que el _ConfigMap_ tenga el archivo de configuración (`.conf`) y de conexión al clúster (_kubeconfig_). Además, verificar que sean válidos.

\-Ver logs

![:scroll:](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/64x64/1f4dc.png) Comandos (Kubectl)
==============================================================================================================================================================

### Banderas/flags o parámetros

#### Correr en modo simulación

`--dry-run=client`

#### Cambiar formato de salida

`-o yaml/json`

#### Selector por Labels

`--selector label=value`

O bien

`-l label=value`

### Generales

#### Obtener info. del cluster

`kubectl cluster-info`

#### Ver configuración actual

`kubectl config-view`

#### Identificar perfil de configuración en uso

`kubectl config current-context`

#### Ver objetos

`kubectl get nodes/deployments/pods/services/namespaces/replicasets`

El parámetro “-o wide” muestrá más info, incluida la IP.

Existen abreviaciones como “svc” para “services” y “ns” para “namespaces”.

Se pueden ver varios tipos de objeto a la vez, numerandolos con coma: kubectl get pod,svc

El parámetro “-l <label>” permite filtrar por label.

#### Ver eventos

`kubectl get events`

#### Desplegar con un manifiesto YAML

`kubectl apply -f <rutaDeManifiesto>`

Para desplegar la carpeta actual: `kubectl apply -f .`

#### Editar un recurso desplegado en memoria

`kubectl edit <tipoDeRecurso>/<NombreDeRecurso>`

Editar campos no editables de un recurso y guardar de todos modos genera un archivo temporal _YAML_ en la carpeta donde está ubicada la consola (PWD), útil para re-desplegar con el mismo.

### Cargas de trabajo

#### Crear pod

`kubectl run <nombre> --image <imagen> --port <puerto>`

Los flags `--selector` y `--expose` se pueden agregar para taggear o exponer con servicio, respectivamente.

Para incluir variables de entorno, utilizar `--env:"nombre=valor"` y para incluir un comando `--command -- <comando> <argumento/s>` (debe ser lo último del comando).

`kubectl run <nombre> --image <imagen> --env=”name=alpha” --command -- <comando> <argumento>`

Para asignar una _ServiceAccount_, agregar el parámetro `--serviceaccount <Nombre>`.

#### Exponer un pod

`kubectl expose po <nombrePod> --port <puertoServicio> --selector "label1=value1,label2=value2" --name <nombreServicio> --type ClusterIP`

Luego omitir el parámetro `--target-port` implica que el número de puerto indicado en `--port` (mandatorio) será el utilizado también para el _targetPort_. También se puede agregar el protocolo con `--portocol` y valores _TCP_/_UDP_.

#### Crear deployment

`kubectl create deployment <nombreDeployment> --image=<id/url de imagen>`

#### Conectarse a Bash de un POD

`kubectl exec -ti <idDePod> -- /bin/bash`

#### Crear servicio (exponer pods)

`kubectl expose deployment/<nombreDeployment> --type="NodePort" --port <puerto> #Luego para ver el puerto expuesto kubectl describe service <nombreDeployment> #Para conectar curl http://<ip del cluster>:<puertoExpuesto>`

#### Poner un label a un pod

`kubectl label pod <podName> <key:value>`

#### Escalar un deployment

`kubectl scale deployments/<NombreDeployment> --replicas=<númeroDeReplicas>`

#### Actualizar un despliegue

`kubectl set image deployments/<nombreDeployment> <nombreDeployment>=<repositorio>/<imagen> #Seguimiento kubectl rollout status deployments/<nombreDeployment>`

#### Hacer un rollback de despliegue

`kubectl rollout undo deployments/<nombreDeployment>`

#### Cambiar imagen de despliegue

`kubectl set image <deployment> <nombreContainer>=<nombreImagen>`

#### Forwardear puerto local a Kubernetes

`kubectl port-forward service/<servicio> <PuertoLocal>:<PuertoDestino>`

También sirve con un pod.

#### Reiniciar un deployment sin re-deployar

`#Apagar kubectl scale deployment <Deployment> --replicas=0 #Encender kubectl scale deployment <Deployment> --replicas=<CantidadPodsDeseada> #O bien kubectl rollout restart <deployment>`

#### Desplegar con un manifiesto YAML

`kubectl apply -f <rutaDeManifiesto>`

#### Invocar un servicio por FQDN

nombre\_servicio.namespace.svc

`#Ejemplo ping prometheus-k8s.monitoring.svc`

#### Ver logs de un pod

`kubectl logs <pod>`

El parámetro `-f` permite hacer un _Tail_ y ver el log en vivo.

### Otros

### Obtener info de recursos API

`kubectl api-resources`

#### Debugear DNS

[https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)

`#Implementar pod de debugging de DNS kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml #Ver si resuelve el default DNS service kubectl exec -ti dnsutils -- nslookup kubernetes.default #Ver si esta bien mapeado el nameserver local kubectl exec -ti dnsutils -- cat /etc/resolv.conf #Ver si estan corriendo los pods de kube-dns kubectl get pods -n kube-system -l k8s-app=kube-dns #Ver si hay logs de error kubectl logs -n kube-system -l k8s-app=kube-dns #Ver si existe el servicio kubectl get svc -n kube-system`

#### Crear Config-Map

`kubectl create configmap <name> --from-file=<pathfile1> --from-file=<pathfile2> #O bien kubeclt create configmap <name> --from-literal=<NombreValor1>=<Valor1>`

Luego invocar como Volume Mount y Volume Path en el deployment.

#### Crear secreto

`kubectl create secret generic <nombre> --from-file/literal`

#### Esperar una condicion

`kubectl wait --for=condition=Ready -l=<LabelsDePod> #O bien kubectl wait --for=<Verbo> -l=<LabelsDePod>`

Parámetro `--timeout` para poner un deadline.
