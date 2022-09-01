![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog App

> This app is a classic example of a blog website. This functional website shows the list of posts and empower readers to interact with them by adding comments and liking posts.

Everything is based on the UML class diagram presented below.

![blog_app_erd](https://user-images.githubusercontent.com/98363075/183529490-308a4bfa-07da-4c8f-b24d-4f95df44d2c4.png)

## Built With

- Ruby, Rails, SQL.

## Setup Project
- Clone repo by using (https://github.com/Santiago220991/Blog-App.git)
- Install dependencies with `bundle install`

## Usage
- Run  `rake db:create`
- Run `rails server`
- Open a browser an introduce the next URL: http://127.0.0.1:3000/ 
- Create a new user using the Sign up button.
- Once you create a new user you will redirect to the login page. Before login check the rails server console for a message like this:

<p>Welcome user@gmail.com!</p>

<p>You can confirm your account email through the link below:</p>

<p><"http://localhost:3000/users/confirmation?confirmation_token=xxxxxxxx">Confirm my account</p>


Open the link, then login with your mail and password.

## Tests
- Run test with `rspec spec`

## Author

👤 **Santiago Cárdenas**

- GitHub: [@Santiago Cárdenas](https://github.com/Santiago220991)
- LinkedIn: [Santiago Cárdenas](https://www.linkedin.com/in/alexandersantiagocardenas/)
- Twitter: [@SanCardenas10](https://twitter.com/SanCardenas10)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Santiago220991/Blog-App/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Original design idea by Microverse.

## 📝 License

This project is [MIT](./MIT.md) licensed.
