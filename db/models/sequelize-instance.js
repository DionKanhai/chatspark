const { Sequelize } = requrie('sequelize');

// CREATE a Sequelize instance
const sequelize = new Sequelize('chatsparky', 'chatty', 'chattysparky', {
  host: 'localhost',
  dialect: 'postgres',
});


// Test the connection
sequelize
  .authenticate()
  .then(() => {
    console.log('DATABASE CONNECTED!');
  })
  .catch((error) => {
    console.error('unable to connect to your database', error);
  });


module.exports = sequelize;