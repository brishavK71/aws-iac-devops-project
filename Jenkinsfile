pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'us-west-1'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/yourusername/aws-iac-devops-project.git'
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Configure with Ansible') {
      steps {
        dir('ansible') {
          sh 'ansible-playbook playbook.yml -i inventory.ini --private-key ~/.ssh/your-key.pem -u ubuntu'
        }
      }
    }

    stage('Health Check') {
      steps {
        script {
          def serverIp = sh(script: "terraform -chdir=terraform output -raw web_instance_ip", returnStdout: true).trim()
          sh "curl -I http://${serverIp}"
        }
      }
    }
  }
}
