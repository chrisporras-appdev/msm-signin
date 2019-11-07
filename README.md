# MSM Signin

Explore [our new target](https://msm-signin.matchthetarget.com/). How is it different from [MSM GUI](https://msm-gui.matchthetarget.com/)? What are the new URIs that users can visit? What are the new database tables that users can CRUD into?

Invent a backend and an interface using the tools in your belt!

If you want to, scroll down for some hints.

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---


## Add a user table

[https://chapters.firstdraft.com/chapters/770#the-draftmodel-generator-does-it-all-at-once](https://chapters.firstdraft.com/chapters/770#the-draftmodel-generator-does-it-all-at-once)

Some columns to add:

 - Email
 - First name
 - Last name
 - Password

## Build a sign up form

 - These actions are like the ones you've building for the last couple of weeks to insert records.
 - We should validate the presence and uniqueness (case insensitive) of email:

    ```ruby
    validates(:email,
      {
        :presence => true
        :uniqueness => { case_sensitive: false }
      }
    )
    ```
 - We should validate the presence of password.

## Build a sign in form

 - These actions should let someone tell us their email and password and we should look them up and verify that their password matches the one they signed up with.
 - If it does match, we should store a cookie containing their user ID.

## Add a bookmarks table

 - We should add a join table between users and movies. When someone clicks "Bookmark this movie!" we should insert a record into this table that captures the user's ID and the movie's ID.
 - We can use an `<input type="hidden">` with the movie's ID pre-populated in its `value=""` attribute to sneak the info into the `params` without the user having to see it.
 - We can use the same trick for the user ID, or we just assign it directly from the `session` hash instead of the `params` hash.