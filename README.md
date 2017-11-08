SpreeGiftCard
=============

SpreeGiftCard is an extension and one stop solution to integrate gift card functionality in a spree application.

* This extension allows the admin to create a gift card, by just enabling it from Admin end.

* Gift card is treated and can be bought as any normal product from your spree store. When a gift card is successfully bought, its details are sent to recipient's email address, which includes gift card `Code`.

* Recipient can then redeem the gift card by entering the unique gift card `Code` during checkout on payment step.

## Installation

1. Add this extension to your Gemfile with this line:

  #### Spree >= 3.2

  ```ruby
    gem 'spree_gift_card' , github: 'vinsol-spree-contrib/spree_gift_card'
  ```

  #### Spree < 3.2

  ```ruby
  gem 'spree_gift_card', github: 'vinsol-spree-contrib/spree_gift_card', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.


2. Install the gem using Bundler:
  ```shell
  bundle install
  ```

3. Copy & run migrations
  ```shell
  bundle exec rails g spree_gift_card:install
  ```

4. Seed the default data with:
   ```ruby
    rails g spree_gift_card:seed
    ```

## Working

* A gift card is created by default when you seed data. Admin can also create `gift card` through

    `Admin -> Products -> New`

    while creating a new gift card, check `is gift card`, which means the product is gift card.
* Once gift card is created, it is visible to customer.
* One needs to add gift card shipping category to a shipping method to purchase a gift card.
* When purchasing a gift card, a form is rendered to user, on which one can fill the `value`,`email`, `recipient name` and `note`. Once your order-payment is successfully captured, the gift card will be send to the email mentioned in gift card form.
* The `Email` will contain details of gift card, amount, code, sender's email and note.
* One can redeem the gift card by applying gift card code at payment step.

**Here is a detailed article with screenshot http://vinsol.com/spreecommerce-gift-card**

## Testing

  #### Spree >= 3.1

  For Building Dependencies:
  ```shell
  appraisal install
  ```

  The dummy app can be regenerated by using:
  ```shell
  appraisal spree-3-1 rake test_app

  ```
  This will run rake test_app using the dependencies configured for Spree 3.1. Similarly you can use spree-3-2 and spree-master for generating dummy applications using dependencies for Spree 3.2 and latest version of Spree

  ```shell
  appraisal spree-3-1 rspec
  ```
  This will run rspec using the dependencies configured for Spree 3.1. Similarly you can use spree-3-2 and spree-master to run rspec using dependencies for Spree 3.2 and latest version of Spree


  #### Spree 3.0 and Spree 2.x

  First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

  ```shell
  bundle
  bundle exec rspec spec
  ```

## Contributing

1. Fork the repo.
2. Clone your repo.
3. Run `bundle install`.
4. Run `bundle exec rake test_app` to create the test application in `spec/test_app`.
5. Make your changes.
6. Ensure specs pass by running `bundle exec rspec spec`.
7. Submit your pull request.


Copyright (c) 2012 Jeff Dutil, released under the New BSD License
