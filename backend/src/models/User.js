
class User {
    constructor({ email, password, name, username,roll_number, semester,phone }) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.username = username;
        this.roll_number = roll_number;
        this.semester = semester;
        this.phone = phone;
    }
}

module.exports = User;
