const express = require('express')
const mongoose = require('mongoose')
const app = express()
const ShortUrl = require('./models/shortUrl')
app.set('view engine', 'ejs')
app.use(express.urlencoded({extended: false}))


mongoose.connect('mongodb+srv://aqib:KRm_PXWe7d4Wg2t@cluster0.yadw3d8.mongodb.net/urlShortener?retryWrites=true&w=majority')
app.get('/', async(req, res) => {
    const shortUrls = await ShortUrl.find({})
    res.render('index', {shortUrls})
})
app.post('/shortUrls',async (req, res) => {
    await ShortUrl.create({full: req.body.fullUrl})
    res.redirect('/')
})
app.get('/:shortUrl', async(req, res) => {
    const shortUrl = await ShortUrl.findOne({short: req.params.shortUrl})
    if(shortUrl == null) return res.sendStatus(404)
    shortUrl.clicks++
    shortUrl.save()
    res.redirect(shortUrl.full)
})
app.listen(process.env.PORT || 5000)