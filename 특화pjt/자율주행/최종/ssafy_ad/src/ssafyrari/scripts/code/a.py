import cv2
import numpy as np

# 예: 파란색의 BGR 값
bgr_color = np.array([[[191, 211, 231]]], dtype=np.uint8)

# BGR 값을 HSV 값으로 변환
hsv_color = cv2.cvtColor(bgr_color, cv2.COLOR_BGR2HSV)

print("HSV value:", hsv_color[0][0])