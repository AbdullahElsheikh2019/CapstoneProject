pipeline {
    environment {
        registry = "https://372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity"
        registryCredential = 'ECR'
        dockerImage = '372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest'
  }
     agent any
      stages {
         stage('Lint HTML')  { 
            steps  {
                 sh 'tidy -q -e *.html'
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
               sh "kubectl apply -f deployment.yaml"
                  sh " kubectl get pods -l app=app"
               }
            }      
         }
      } 
  
