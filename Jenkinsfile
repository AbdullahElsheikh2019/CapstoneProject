node {
  stage 'git'
  git 'https://github.com/AbdullahElsheikh2019/CapstoneProject.git'
 
  stage 'Docker build'
  docker.build('udacity')
 
  stage 'Docker push'
    script{
      docker.withRegistry('372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity', 'ecr:eu-west-1:UserC3') {
         docker.image('udacity').push('latest')
   }
  }
} 