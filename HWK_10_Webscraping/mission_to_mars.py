from bs4 import BeautifulSoup as bs
from splinter import Browser 
import requests
import pandas as pd
import pymongo

def mars_scrape():  
    executable_path = {'executable_path': 'chromedriver.exe'}

    browser = Browser('chrome', **executable_path, headless=False)

    # PART 1

    # Scrape the [NASA Mars News Site](https://mars.nasa.gov/news/) and collect the
    #  latest News Title and Paragraph Text. Assign the text to variables that you can reference later.
    url1 = "https://mars.nasa.gov/news/" 
    browser.visit(url1)
    html = browser.html
    soup = bs(html, 'html.parser')

    Article_Title = soup.find_all('div',class_="content_title")[0].a.text
    print(Article_Title)

    Article_Text = soup.find_all('div',class_="rollover_description_inner")[0].text
    print(Article_Text)

    # PART 2

    #Visit the url for JPL Featured Space Image [here](https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars).
    # Use splinter to navigate the site and find the image url for the current Featured
    #  Mars Image and assign the url string to a variable called `featured_image_url`.
    # Make sure to find the image url to the full size `.jpg` image.
    # Make sure to save a complete url string for this image.
    #SPLINTER 
    url2 = 'https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars'
    browser.visit(url2)
    html = browser.html
    soup2 = bs(html, 'html.parser')
    #Finding the image url and creating the full url for this image
    featured_image_url = 'https://www.jpl.nasa.gov' + soup2.body.find_all('div',class_="default floating_text_area ms-layer")[0].footer.a['data-fancybox-href']
    #printing the url
    print(featured_image_url)
    # Visit the Mars Weather twitter account [here](https://twitter.com/marswxreport?lang=en)
    #  and scrape the latest Mars weather tweet from the page. Save the tweet text for the
    #  weather report as a variable called `mars_weather`.
    # url3 = 'https://twitter.com/marswxreport?lang=ens'
    # browser.visit(url3)
    # html = browser.html
    # soup3 = bs(html, 'html.parser')
    # #how can I do this with out using split....
    # mars_weather = soup3.body.find_all('div', class_= "js-tweet-text-container")[0].p.text.split("pic")[0]
    # #print mars_weather
    # print(mars_weather)

    # Visit the Mars Facts webpage [here](https://space-facts.com/mars/) and use Pandas to scrape
    #  the table containing facts about the planet including Diameter, Mass, etc.
    url4 = 'https://space-facts.com/mars'
    #  Use Pandas to convert the data to a HTML table string.
    Mars_Facts = pd.read_html(url4)[0]
    # Re-name columns
    Mars_Facts.columns = ['Characteristics','Value']
    # Show Mars Facts Table
    Mars_Facts.head()

    #Visit the USGS Astrogeology site [here](https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars)
    #  to obtain high resolution images for each of Mar's hemispheres.
    url5 = 'https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars'
    browser.visit(url5)
    html = browser.html
    soup5 = bs(html, 'html.parser')
    #You will need to click each of the links to the hemispheres in order to 
    #  find the image url to the full resolution image.
    USGS_images = soup5.find_all('div', class_= "item")
    Mars_list_dic = []
    for i in USGS_images:
        url = 'https://astrogeology.usgs.gov'+ i.a['href']
        browser.visit(url)
        html = browser.html
        soup = bs(html, 'html.parser')
        Mars_list_dic.append({'img_url':soup.find_all('li')[0].a['href'],'title':soup.find_all('h2', class_='title')[0].text})

        
    print(Mars_list_dic)
    # Save both the image url string for the full resolution hemisphere image, and 
    #  the Hemisphere title containing the hemisphere name. Use a Python dictionary to 
    #  store the data using the keys `img_url` and `title`.

    # Append the dictionary with the image url string and the hemisphere title to a 
    #  list. This list will contain one dictionary for each hemisphere.

    post = {
        "Article_title": Article_Title,
        "Article_text": Article_Text,
        "featured_image_url": featured_image_url,
        "hemi_images": Mars_list_dic
    }

    return post