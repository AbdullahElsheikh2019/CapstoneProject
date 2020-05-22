pipeline {
    environment {
        registry = "https://372839978247.dkr.ecr.eu-west-1.amazonaws.com"
        registryCredential = 'AWSECR'
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
               sh "docker build --build-arg -t 372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest -f Dockerfile ."
            }   
         }
         stage('Push image') {
            steps{
                script {
                    docker.withRegistry( registry, registryCredential ) {
                        dockerImage.push()
                        }
                    }
               }
            }   
         }
      } 
  
