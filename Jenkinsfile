pipeline {
    environment {
        registry = "https://372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity"
        registryCredential = 'ECR'
        dockerImage = '372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest'
  }
     agent any
      stages {
         stage('Install Requirements')  { 
            steps  {
               sh 'make setup'
                     sh "make install "

               }       
            } 
         stage('Lint stage')  { 
            steps  {
               sh 'hadolint Dockerfile'
                  sh "pylint --disable=R,C,w1309,W1203 app.py"
               
            }       
         } 
         stage('Security Scan') {
            steps { 
                  aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
            }
         }  
         stage('Clone repository') {
            steps { 
               git branch: "master", url: "https://github.com/AbdullahElsheikh2019/CapstoneProject.git", credentialsId: "jenkins-github"
            }
         }
         stage('Build image') {
            steps { 
               sh "docker build --build-arg APP_NAME=app -t 372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest -f Dockerfile ."
            }   
         }
         stage('Push image') {
            steps{
                script {
                    docker.withRegistry( registry, registryCredential ) {
                        sh "docker push 372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest"
                        }
                    }
               }
            }
         stage('Run in Kubernetes') {
            steps{
               sh "chmod +x run_kubernetes.sh"
               sh "./run_kubernetes.sh"
            }
            }      
         }
      } 
  
