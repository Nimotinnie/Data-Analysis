
#匯入圖片
from PIL import Image
image_martini_path = '1martini.jpeg'
image_martini = Image .open(image_martini_path)

image_margarati_path = '2.margarati.jpeg'
image_margarati = Image .open(image_margarati_path)

image_cosmopolitan_path = '3.cosmopolitan.jpeg'
image_cosmopolitan = Image .open(image_cosmopolitan_path)

image_sex_on_the_beach_path = '4.sex on the beach.jpeg'
image_sex_on_the_beach = Image .open(image_sex_on_the_beach_path)

image_bloody_mary_path = '5.bloody_mary.jpeg'
image_bloody_mary= Image .open(image_bloody_mary_path)

image_Daiquiri_path = '6.Daiquiri.jpeg'
image_Daiquiri = Image .open(image_Daiquiri_path)

image_Mojito_path = '7.Mojito.jpeg'
image_Mojito = Image .open(image_Mojito_path)


from PIL import Image

def open_and_show_image(image_path):
    # 打开图像
    image = Image.open(image_path)

    # 显示图像
    image.show()

    # 关闭图像（关闭图像窗口后，程序将继续执行）
    image.close()

# 不同类型的图片路径
image_paths = [
    '8.Long Island Iced Tea.jpg',
    '9.Negroni.jpg',
    '10.Old Fashioned.jpg',
    '11.Gimlet.jpg',
    '12.French 75.jpg',
    '13.Boulevardier.jpg',
    '14.Tommy’s Margarita.jpg',
    '15.Penicillin.jpg',
    '16.Clover Club.jpg',
    '17.Gin Gin Mule.jpg',
    '18.Pornstar Martini.jpg',
    '19.Old Cuban.jpg'
]

# 循环遍历不同类型的图片并调用函数显示
for image_path in image_paths:
    open_and_show_image(image_path)







