pipeline {
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
               git branch: "master", url: "https://github.com/AbdullahElsheikh2019/CapstoneProject.git", credentialsId: "jenkins-github"
         }
         stage('Build image') {
               sh "docker build --build-arg APP_NAME=app -t 372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest -f /Dockerfile ."
         }
         stage('Push image') {
               docker.withRegistry('https://372839978247.dkr.ecr.eu-west-1.amazonaws.com', 'ecr:eu-west-1:bttrm-backend-ecr') {
                  sh "docker push 372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity:latest"
               }
         }
         stage('Upload to AWS')  {
               steps  {
                     withAWS(region:'eu-west-1',credentials:'UserC3') {
                     sh 'echo "Uploading content with AWS creds"'
                     s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'jenkinsabdullah')
                  }
               }
         }
      }   
}      
