when seeding from kindle (after processing the highlights page via two scripts, the first to obtain popup wisdom worthy qoutes, and the second to transform these quotes into seeds.rb):
you will need to manually replace certain unsupported characters. Do this in a step by step process using notepad++. Try rake db:seed, and when errors are reported, make a "replace all" with notepad++, slowly but surely, you will correct all invalid characters. Eg. invalid characters include:
em dash => -
` => '
e accent aigu => e
e accent grave => e
etc.
