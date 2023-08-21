# Kubernetes with containerd

![Arch](.github/images/k8s-containerd.png)

Projeto que cria um cluster Kubernetes com containerd

## Agradecimento

Esse projeto foi baseado no [Kubernetes setup with CRI-O Runtime](https://github.com/msfidelis/kubernetes-with-cri-o) do [Matheus Fidelis](https://github.com/msfidelis).

Fiz alguns ajustes e adaptei para o containerd. Foi de grande aprendizado e conhecimento.

Obrigado, Matheus Fidelis!

## Ferramentas utilizadas

* **Amazon Web Services**
  * [Website](https://aws.amazon.com/free/free-tier/)
  * [Docs](https://docs.aws.amazon.com/)

* **Terraform**
  * [Website](https://www.terraform.io/)
  * [Docs](https://www.terraform.io/docs/index.html)

* **Ansible**
  * [Website](https://www.ansible.com/)
  * [Docs](https://docs.ansible.com/)

* **Kubernetes**
  * [Website](https://kubernetes.io/)
  * [Docs](https://kubernetes.io/docs/home/)

* **containerd**
  * [Website](https://containerd.io/)
  * [cri-tools](https://github.com/kubernetes-sigs/cri-tools)

# Como fazer o deploy

## Gerar um par de chaves

```
ssh-keygen -P "" -t rsa -b 2048 -f ~/aws_key
```

## Terraform

Editar `variables.tf`

```
default = "../../keys/aws_key.pub"
```

Criar instância EC2 na AWS

Inicializar Terraform

```bash
terraform init
```

Criar o plano

```bash
terraform plan
```

Aplicar as mudanças

```bash
terraform apply
```

Outputs gerados

```
instance_k8s_master = "18.216.69.105"
instance_k8s_nodes = [
  "52.15.193.92",
  "3.17.138.190",
]
```

## Ansible

Editar `ansible.cfg`

```
private_key_file=./keys/aws_key
```

Editar `main.yml` dentro do `inventory`

```
masters:
  hosts:
    18.216.69.105:
nodes:
  hosts:
    52.15.193.92:
    3.17.138.190:
```

Executar o playbook

```
ansible-playbook k8s-with-containerd.yml
```

## Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](LICENSE) para mais detalhes.

[Voltar ao topo](#kubernetes-with-containerd)
