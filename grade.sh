#javac Server.java GradeServer.java
#java GradeServer 6023
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
rm -rf student-submission
rm -rf grading-area
mkdir grading-area
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
FILE=`find * -name ListExamples.java`
FILENAME="ListExamples.java"
echo $FILE
if [[ $FILE == $FILENAME ]]
then
    echo "Correct file found"
else
    echo "File not found"
    exit
fi

cd ..
cp -r student-submission grading-area
cd grading-area
cd student-submission
cp -r TestListExamples.java grading-area
pwd


javac -cp "$CPATH" *.java
java -cp "$CPATH" org.junit.runner.JUnitCore TestListExamples
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests