# ---
# title: Non-local Mean Filter
# cover: assets/nlmean_cover.png
# description: This demo shows how to use Non-local Mean filter to reduce gaussian noise
# ---

using ImageNoise, TestImages, ImageShow, ImageCore, ImageQualityIndexes
using FileIO, Random #src


gray_img = testimage("cameraman") .|> float32
n = AdditiveWhiteGaussianNoise(0.1)
noisy_img = apply_noise(gray_img, n)

f_nlmean = NonlocalMean(0.1)
denoised_img = reduce_noise(noisy_img, f_nlmean)

[gray_img noisy_img denoised_img]

#+

psnr(gray_img, denoised_img)

save("assets/nlmean_cover.png", denoised_img) #src