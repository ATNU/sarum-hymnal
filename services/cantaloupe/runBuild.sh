git clone https://github.com/medusa-project/cantaloupe.git .cache/cantaloupe
cd .cache/cantaloupe
git checkout version 4.0.2
cd ../../
ls
docker run -it --rm --name cantaloupeBuild -v "$PWD/.cache/cantaloupe":/usr/src/cantaloupe -v $PWD/.cache/mvn:/root/.m2 -w /usr/src/cantaloupe maven:3.2-jdk-8 mvn clean package -DskipTests
mv .cache/cantaloupe/target/cantaloupe-4.0-SNAPSHOT.war services/cantaloupe/cantaloupe.war
rm -rf .cache/cantaloupe
