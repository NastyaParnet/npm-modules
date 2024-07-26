# Practical task

You need to implement an npm package that converts scores from the 100-point grading system to the ECTS format.

To achieve this, your package should include a class called **_ECTS_**, which you will export. The constructor of this class should accept one parameter, which is the score in the 100-point format. Additionally, the class should have a method called **_ectsFromScore()_** that will return the corresponding **_ECTS_** value for the given score.

The score-to-ECTS conversion ratios are provided in the table.

![table](ECTS.png)

Publish the created module on npm and write its name in the [name.txt](name.txt) file. You need to push only [name.txt](name.txt) as the result of this task. Do not make any changes to other files in this repository. You can create another repository for code of your package. Tests will retrieve your published package from **npm**.

> Name your package in the format ects-your-full-name because npm does not allow two packages with the same name.

## How to test localy

Publish your package and write name of it in [name.txt](name.txt). 

On *Unix*-systems follow next steps:

1. Navigate to the root directory of this project.
2. Run `chmod +x .github/workflows/test.sh`
3. Run `./.github/workflows/test.sh`

For Windows, you have two options:

1. Use the prepared .bat script. Run the following command from the root directory of this project: `.\.github\workflows\test.bat`
2. Alternatively, use the *Git Bash* terminal and follow instructions for *Unix*-systems

After testing, you will see the created `package.json` file. Remember that you should not push it to GitHub in this task (do not delete anything from [.gitignore](.gitignore))
