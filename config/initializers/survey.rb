SURVEY = {
  QUESTIONS: [
    {
      content: 'First things first, tell us your name.',
      id: 'name',
      type: 'text',
      type_order: '1 of 7'
    },
    {
      content: 'What is your age?',
      id: 'age',
      type: 'radio',
      type_order: '2 of 7',
      options: [
        'Under 18',
        '18-24',
        '25-34',
        '35-44',
        '45-54',
        'Over 55'
      ]
    },
    {
      content: 'Are you male or female?',
      id: 'gender',
      type: 'radio',
      type_order: '3 of 7',
      options: [
        'male',
        'female'
      ]
    },
    {
      content: 'What do you usually buy from your favorite local shops?',
      id: 'favorite_product',
      type_order: '4 of 7',
      type_select: 'Select all that apply',
      options: CATEGORIES
    },
    {
      content: 'How often do you visit them?',
      id: 'visit_frequency',
      type: 'radio',
      type_order: '5 of 7',
      options: [
        '1-3 times per month',
        '3-5 times per month',
        '5-9 times per month'
      ]
    },
    {
      content: 'What issues do you face when you buy local?',
      id: 'issue',
      type_order: '6 of 7',
      type_select: 'Select all that apply',
      options: [
        'Your shop is too far',
        'Your shop is too crowded',
        'You can’t find what you need',
        'No parking available',
        'No public transport available',
        'Limited selection'
      ]
    },
    {
      content: 'What are you looking to find when you explore shops?',
      id: 'needed_product',
      type_order: '7 of 7',
      type: 'text'
    }
  ]
}


# add a new type radio (to accept only one answer)
# show radio button instead of checkbox
# duplicate CSS and JS
