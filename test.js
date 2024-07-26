const ECTS = require(process.argv[2]);
const ectsScores = [91, 80, 70, 60, 45, 30];
ectsScores.forEach(score => {
  const ectsCalculator = new ECTS(score);
  const ectsResult = ectsCalculator.ectsFromScore(); 
  console.log(`Score: ${score}, ECTS Grade: ${ectsResult}`);
});
