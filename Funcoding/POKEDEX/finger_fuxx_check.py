import cv2
import mediapipe as mp


mp_drawing = mp.solutions.drawing_utils
mp_hands = mp.solutions.hands

cap = cv2.VideoCapture(0)


with mp_hands.Hands(
    max_num_hands=1,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5) as hands:

    while cap.isOpened():
        success, image = cap.read()
        if not success:
            continue

        image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)
        results = hands.process(image)

        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)

        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:


               rjawl = hand_landmarks.landmark[7] # 검지
               rjawl2 = hand_landmarks.landmark[5]
             
               wndwl = hand_landmarks.landmark[12] # 중지 
               wndwl2 = hand_landmarks.landmark[9]

               dirwl = hand_landmarks.landmark[15] # 약지 
               dirwl2 = hand_landmarks.landmark[13]

               thwl = hand_landmarks.landmark[19]  #소지 
               thwl2 = hand_landmarks.landmark[17]

               rjadiff = abs(rjawl.y - rjawl2.y) #검지 

               wnddiff = abs(wndwl.y - wndwl2.y) #중지 

               dirdiff = abs(dirwl.y - dirwl2.y) #약지

               thdiff = abs(thwl.y - thwl2.y) #소지


               rja = int(rjadiff * 500) 

               wnd = int(wnddiff * 500)

               dir = int(dirdiff * 500)

               th = int(thdiff * 500)

            
            cv2.putText(
                    image, text='Index3: %d' % rja, org=(10, 30), #검지
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=255, thickness=2)

            cv2.putText(
                    image,   text='Middel: %d' % wnd, org=(70, 70), #중지
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=255, thickness=2)

            cv2.putText(
                    image,  text='Ring: %d' % dir, org=(120, 120), #약지
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=255, thickness=2)

            cv2.putText(
                    image,  text='Pinky: %d' % th, org=(160, 160), #소지
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=255, thickness=2)


            if wnd > 150 and rja < 80 and dir < 80 and th < 80:
                cv2.putText(
                    image,  text='Fuck you!!!FUCK ', org=(440, 440), 
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=235, thickness=2)


            mp_drawing.draw_landmarks(
                    image, hand_landmarks, mp_hands.HAND_CONNECTIONS)

       
            

        
                    
                    
                  

        cv2.imshow('image', image)
        if cv2.waitKey(1) == ord('q'):
            break

    cap.release()



"""
                thumb = hand_landmarks.landmark[4]
                index = hand_landmarks.landmark[8]

                diff = abs(index.x - thumb.x)

                volume = int(diff * 500)

               

                cv2.putText(
                    image, text='Volume: %d' % volume, org=(10, 30),
                    fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1,
                    color=255, thickness=2)

  text='중지: %d' % wnd, org=(40, 50),
                           text='약지: %d' % dir, org=(60, 70),
                           text='소지: %d' % th, org=(80, 90),


                """