---
layout: page
title: R Markdown Tips
description: tips on how to improve r markdown aesthetics
---

Below are a few tips on how to keep the homework reports looking clean.

* If you're using pdf as an output, keep in mind knitr does not automatically wrap your code chunks, and they will run off the page if too long. Be aware of this and add line breaks where appropriate. With this in mind, it may be optimal to knit to html.
* Usually you shouldn't include particular R outputs in your final version of homeworks. You should for sure look at and use the output for yourself, but you can just refer to the important results in-line when writing your analyses.
* To reference previously computed statistics outside your code chunks, use inline code chunks. The syntax is \`r some\_code \`. For instance, if I've saved the mean of a variable as my\_mean and want to reference it instead of manually typing the numbers, writing \`r my_mean \` will input the value my\_mean into your paragraph. You can tinker with the round() or formatC() functions to deal with rounding and formatting the numerical value.
* You can also use ` ` to reformat a word to look like code. This is mostly for aesthetic purposes, but if I want to tell the reader I'm using the R function, say, Anova, then writing "we will be utilizing the `Anova` function to..." and it will stand out more.
* When presenting statistics in a table, try to avoid supplying just the R output. Remember, you are presenting this information to someone that can read statistics, but is not familiar with R. Look into table making packages such as kableExtra.
* Another aesthetic preference, but figures could be wider to fill up the unused white space in the page, making them larger and easier to read. You can tinker with the fig.width and fig.height code chunk options, and fig.width=10 will make your figures as wide as the page.
* To prevent messages or warnings from showing up in your pdf or html file (for example, after loading a package) you can add message=FALSE and warning=FALSE into your chunk options.
* Try to avoid letting R set the axis labels, as they could just be R code like data$variable when instead you want a nicer looking label. It only takes one more line of code and your figures will thank you for it.
