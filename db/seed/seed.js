const faker = require('faker');
const sequelize = require('../models/sequelize-instance');
const User = require('../models/user');


async function seedDatabase() {

  for (let i = 0; i < 10; i++) {
    await User.create({
      username: faker.internet.userName(),
      email: faker.internet.email(),
      password: faker.internet.password(),
    });
  }

  console.log('Seeding finished!')
}

seedDatabase()
  .then(() => {
    sequelize.close();
  })
  .catch(error => {
    console.error('Error seeding database:', error);
  });